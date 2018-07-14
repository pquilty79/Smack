//
//  ChannelVC.swift
//  Smack
//
//  Created by Patrick Quilty on 7/7/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {
    
    
//Outlets
    @IBOutlet weak var loginButton: UIButton!
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    

// Actions
    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }
    
    @IBAction func addChannelButtonPressed(_ sender: Any) {
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController()?.rearViewRevealWidth = self.view.frame.size.width - 60
        
    }

}
