//
//  RepoCell.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 27/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var repoDescription: UILabel!
    @IBOutlet weak var repoImage: UIImageView!
    @IBOutlet weak var repoForks: UILabel!
    @IBOutlet weak var repoLanguage: UILabel!
    @IBOutlet weak var repoContributors: UILabel!
    @IBOutlet weak var readmeButton: UIButton!
    @IBOutlet weak var backView: CardView!
    
    private var repoUrl:String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupViewCell (repo: Repo) {
        self.repoName.text = repo.name
        self.repoDescription.text = repo.description
        self.repoImage.image = repo.image
        self.repoForks.text = String(describing: repo.numberOfForks)
        self.repoLanguage.text = repo.language
        self.repoContributors.text = String(describing: repo.numberOfContributors)
        self.repoUrl = repo.url
    }

}
