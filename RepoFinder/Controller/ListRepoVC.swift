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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        repoTableView.delegate = self
        repoTableView.dataSource = self
    }

}

extension ListRepoVC : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "repo_cell", for: indexPath) as? RepoCell {
            cell.setupViewCell(repoName: "Swift Documentation")
            return cell
        } else {
            return RepoCell()
        }
    }
    
    
}

