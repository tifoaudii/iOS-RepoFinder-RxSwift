//
//  DataService.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 28/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DataService {
    
    //MARK : Singleton Instance
    static let sharedInstance = DataService()
    
    //MARK : Helper functions
    func downloadTrendingRepos(completion: @escaping(_ reposArray:[Repo]) -> ()) {
        var reposArray = [Repo]()
        
        self.fetchTrendingRepoDictsArrays { (trendingRepos) in
            for repo in trendingRepos {
                self.getRepo(fromDict: repo, completion: { (returnedRepo) in
                    if reposArray.count < trendingRepos.count - 1 {
                        reposArray.append(returnedRepo)
                    } else {
                        completion(reposArray)
                    }
                })
            }
        }
    }
    
    private func fetchTrendingRepoDictsArrays(completion: @escaping(_ reposDictsArrays: [Dictionary<String,Any>]) -> ()) {
        
        var trendingReposArray = [Dictionary<String,Any>]()
        
        Alamofire.request(trendingRepoUrl).responseJSON { (response) in
            guard let json = response.result.value as? Dictionary<String,Any> else { return }
            guard let reposDictArray = json["items"] as? [Dictionary<String,Any>] else { return }

            for dict in reposDictArray {
                print(dict)
                if trendingReposArray.count < 10 {
                    guard let name = dict["name"] as? String,
                        let description = dict["description"] as? String,
                        let numberOfForks = dict["forks_count"] as? Int,
                        let language = dict["language"] as? String,
                        let repoUrl = dict["html_url"] as? String,
                        let ownerDict = dict["owner"] as? Dictionary<String,Any>,
                        let avatarUrl = ownerDict["avatar_url"] as? String,
                        let contributorsUrl = dict["contributors_url"] as? String else { continue }
                    
                    let repoDictionary: Dictionary<String,Any> = ["name": name, "description" : description, "numberOfForks": numberOfForks, "language": language, "repoUrl": repoUrl, "avatarUrl": avatarUrl, "contributorsUrl": contributorsUrl]
                    trendingReposArray.append(repoDictionary)
                } else {
                    break
                }
            }
            print(trendingReposArray.count)
            completion(trendingReposArray)
        }
    }
    
    private func getRepo(fromDict dict: Dictionary<String,Any>, completion: @escaping (_ repo: Repo)->()) {
        let avatarUrl = dict["avatarUrl"] as! String
        let name = dict["name"] as! String
        let contributorsUrl = dict["contributorsUrl"] as! String
        let description = dict["description"] as! String
        let numberOfForks = dict["numberOfForks"] as! Int
        let language = dict["language"] != nil ? dict["language"] as! String : "none"
        let repoUrl = dict["repoUrl"] as! String
        
        self.getRepoAvatar(avatarUrl: avatarUrl) { (imageRespon) in
            self.getRepoContributors(forContributors: contributorsUrl, completion: { (contributors) in
                let repo = Repo(name: name, description: description, numberOfForks: numberOfForks, language: language, numberOfContributors: contributors, url: repoUrl, image: imageRespon)
                completion(repo)
            })
        }
    }
    
    private func getRepoAvatar(avatarUrl url: String, completion: @escaping (_ avatar: UIImage)->()) {
        Alamofire.request(url).responseImage { (response) in
            guard let image = response.result.value else { return }
            completion(image)
        }
    }
    
    private func getRepoContributors(forContributors url: String, completion: @escaping (_ contributors: Int )-> ()) {
        Alamofire.request(url).responseJSON { (response) in
            guard let contributors = response.result.value as? [Dictionary<String,Any>] else { return }
            if !contributors.isEmpty {
                completion(contributors.count)
            }
        }
    }
}
