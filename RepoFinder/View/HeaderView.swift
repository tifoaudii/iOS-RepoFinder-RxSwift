//
//  HeaderView.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 27/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

@IBDesignable
class HeaderView: UIView {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    override func awakeFromNib() {
        self.setupView()
    }
    
    private func setupView() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }

}
