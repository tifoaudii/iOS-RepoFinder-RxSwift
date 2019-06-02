//
//  SearchTextField.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 28/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

@IBDesignable
class SearchTextField: UITextField {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.layer.cornerRadius = frame.height / 2
        self.attributedPlaceholder = NSAttributedString(string: "search for repo here", attributes: [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)])
    }

}
