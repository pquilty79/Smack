//
//  ChannelVC.swift
//  Smack
//
//  Created by Patrick Quilty on 7/7/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
    }
    


}
