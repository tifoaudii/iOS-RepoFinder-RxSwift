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

    override func layoutSubviews() {
        backView.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        backView.layer.opacity = 0.25
        backView.layer.shadowRadius = 5.0
        backView.layer.shadowOffset = CGSize(width: 0, height: 0)
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
