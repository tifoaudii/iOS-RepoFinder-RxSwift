//
//  FirstViewController.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 18/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListRepoVC: UIViewController {
    
    //MARK : Outlets here
    @IBOutlet weak var repoTableView: UITableView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    //MARK : Properties here
    let refreshControl = UIRefreshControl()
    var dataSource = PublishSubject<[Repo]>()
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupRefreshControl()
        self.fetchTrendingRepos()
        self.bindDataToTableView()
        spinner.startAnimating()
    }
    
    private func setupRefreshControl() {
        repoTableView.refreshControl = self.refreshControl
        refreshControl.tintColor = #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching trending repos", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AvenirNext-DemiBold", size: 16.0)!])
        refreshControl.addTarget(self, action: #selector(self.fetchTrendingRepos), for: .valueChanged)
    }
    
    @objc private func fetchTrendingRepos() {
        DataService.sharedInstance.downloadTrendingRepos { (trendingRepos) in
            self.dataSource.onNext(trendingRepos)
            self.refreshControl.endRefreshing()
            self.spinner.stopAnimating()
            self.spinner.isHidden = true
        }
    }
    
    private func bindDataToTableView() {
        dataSource.bind(to: repoTableView.rx.items(cellIdentifier: "repo_cell")) { (row, repo: Repo, cell: RepoCell) in
            cell.setupViewCell(repo: repo)
        }.disposed(by: disposeBag)
    }

}
    


