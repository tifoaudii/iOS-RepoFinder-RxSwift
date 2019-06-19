//
//  SearchCell.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 18/06/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {

    //MARK: Outlets here
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoForks: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    
    var repoUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupCell(from repo: Repo) {
        self.repoName.text = repo.name
        self.repoDescription.text = repo.description
        self.repoForks.text = String(describing: repo.numberOfForks)
        self.repoLanguage.text = repo.language
        self.repoUrl = repo.url
    }

}
