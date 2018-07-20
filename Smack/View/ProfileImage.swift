//
//  ProfileImage.swift
//  Smack
//
//  Created by Patrick Quilty on 7/20/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import UIKit

@IBDesignable
class ProfileImage: UIImageView {
    
    override func awakeFromNib() {
        self.setUpView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setUpView()
    }
    
    func setUpView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    
}
