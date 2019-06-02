//
//  CardView.swift
//  RepoFinder
//
//  Created by Tifo Audi Alif Putra on 27/05/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    var cornerRadius : CGFloat = 10 {
        didSet {
            self.cornerRadius = self.layer.cornerRadius
        }
    }

    override func awakeFromNib() {
        self.setupView()
    }
    
    private func setupView() {
        self.layer.cornerRadius = cornerRadius
    }

}
