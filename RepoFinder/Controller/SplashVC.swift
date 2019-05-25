//
//  SplashVC.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 18/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class SplashVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(SplashVC.navigateToMain), userInfo: nil, repeats: false)
    }
    
    @objc private func navigateToMain() {
        performSegue(withIdentifier: "main_segue", sender: nil)
    }
    
}
