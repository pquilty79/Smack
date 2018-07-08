//
//  ChatVC.swift
//  Smack
//
//  Created by Patrick Quilty on 7/7/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

    
    //Outlets
    @IBOutlet weak var menuButtun: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuButtun.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        self.view.addGestureRecognizer((self.revealViewController()?.tapGestureRecognizer())!)
    }
    

}
