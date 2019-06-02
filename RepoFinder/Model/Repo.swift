//
//  Repo.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 28/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

struct Repo {
    
    public private(set) var name: String
    public private(set) var description: String
    public private(set) var numberOfForks: Int
    public private(set) var language: String
    public private(set) var numberOfContributors: Int
    public private(set) var url: String
    public private(set) var image: UIImage
    
    init(name: String, description: String, numberOfForks: Int, language: String, numberOfContributors: Int, url: String, image: UIImage) {
        self.name = name
        self.description = description
        self.numberOfForks = numberOfForks
        self.language = language
        self.numberOfContributors = numberOfContributors
        self.url = url
        self.image = image
    }
}
