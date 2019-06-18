//
//  SecondViewController.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 18/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class SearchRepoVC: UIViewController {

    //MARK : Outlets here
    @IBOutlet weak var searchTextField: SearchTextField!
    @IBOutlet weak var searchTableView: UITableView!
    
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bindSearchTextField()
    }
    
    func bindSearchTextField() {
        let searchResult = searchTextField.rx.text
                            .orEmpty
                            .map {
                                $0.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? ""
                            }.flatMap { (query) -> Observable<[Repo]> in
                                print(query)
                                if query == "" {
                                    return Observable<[Repo]>.just([])
                                } else {
                                    let url = searchUrl + query + starsDescendingSegment
                                    var searchRepos = [Repo]()
                                    
                                    return URLSession.shared.rx.json(url: URL(string: url)!).map {
                                        let result = $0 as AnyObject
                                        let items = result.object(forKey: "items") as? [Dictionary<String,Any>] ?? []
                                        
                                        for item in items {
                                            guard let name = item["name"] as? String,
                                                let description = item["description"] as? String,
                                                let language = item["language"] as? String,
                                                let forksCount = item["forks_count"] as? Int,
                                                let repoUrl = item["html_url"] as? String else { continue }
                                            
                                            let repo = Repo(name: name, description: description, numberOfForks: forksCount, language: language, numberOfContributors: 100, url: repoUrl, image: UIImage(named: "code")!)
                                            searchRepos.append(repo)
                                        }
                                        return searchRepos
                                    }
                                }
                            }
                            .observeOn(MainScheduler.instance)
        searchResult.bind(to: searchTableView.rx.items(cellIdentifier: "search_cell")) { (row,repo: Repo,cell: SearchCell) in
            cell.setupCell(from: repo)
        }.disposed(by: disposeBag)
    }

}

