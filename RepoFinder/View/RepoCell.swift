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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupViewCell (repoName: String) {
        self.repoName.text = repoName
    }

}
