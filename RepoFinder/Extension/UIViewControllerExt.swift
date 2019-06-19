//
//  UIViewControllerExt.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 18/06/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    func presentSFSafariVCfor(url: String) {
        let url = URL(string: url + readmeUrl)
        let safariVC = SFSafariViewController.init(url: url!)
        present(safariVC, animated: true, completion: nil)
    }
}
