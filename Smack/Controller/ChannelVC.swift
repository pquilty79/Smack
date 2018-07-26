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
    @IBOutlet weak var profileImage: ProfileImage!
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
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }

    @objc func userDataDidChange(_ notif: Notification) {
        if AuthService.instance.isLogged {
            loginButton.setTitle(UserDataService.instance.name, for: .normal)
            profileImage.image = UIImage(named: UserDataService.instance.avatarName)
           // profileImage.backgroundColor = UIColor(named: UserDataService.instance.avatarColour)
        } else {
            loginButton.setTitle("Login", for: .normal)
            profileImage.image = UIImage(named: "menuProfileIcon")
            profileImage.backgroundColor = UIColor.clear
        }
    }
    
    
}
