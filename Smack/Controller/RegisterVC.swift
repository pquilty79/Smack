//
//  RegisterVC.swift
//  Smack
//
//  Created by Patrick Quilty on 7/8/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
   //Outlets
    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var userProfile: UIImageView!
    
    
    // Variables
    var avatarName = ""
    var avatarColor = "[]"
    
    //Actions
    @IBAction func unwindToChannel(_ sender: Any) { performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func chooseAvatarPressed(_ sender: Any) { performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func generateBackgroundColourPressed(_ sender: Any) {
    }
    
    @IBAction func createAccountPressed(_ sender: Any) {
        guard let email = emailText.text , emailText.text != "" else { return }
        guard let password = passwordText.text , passwordText.text != "" else { return }
        AuthService.instance.registerUser(email: email, password: password) { (success) in if success {
            AuthService.instance.loginUser(email: email, password: password) { (success) in if success {
                    print("logged in user!", AuthService.instance.authToken)
                    }
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            userProfile.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
        }
    }
}
