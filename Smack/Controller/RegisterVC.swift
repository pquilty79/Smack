//
//  RegisterVC.swift
//  Smack
//
//  Created by Patrick Quilty on 7/8/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToChannel(_ sender: Any) { performSegue(withIdentifier: UNWIND, sender: nil)
    }
    

}
