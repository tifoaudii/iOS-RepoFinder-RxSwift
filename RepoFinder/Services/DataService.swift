//
//  DataService.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 28/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import Foundation
import Alamofire

class DataService {
    
    //MARK : Singleton Instance
    static let sharedInstance = DataService()
    
    //MARK : Helper functions
    func fetchTrendingRepoDictsArrays(completion: @escaping(_ reposDictsArrays: [Dictionary<String,Any>]) -> ()) {
        
        var trendingReposArray = [Dictionary<String,Any>]()
        
        Alamofire.request(trendingRepoUrl).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String,Any> else { return }
            guard let reposDictArray = json["item"] as? [Dictionary<String,Any>] else { return }
            for repo in reposDictArray {
                if trendingReposArray.count <= 10 {
                    trendingReposArray.append(repo)
                } else {
                    break
                }
            }
            completion(trendingReposArray)
        }
    }
}
