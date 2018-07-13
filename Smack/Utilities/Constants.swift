//
//  Constants.swift
//  Smack
//
//  Created by Patrick Quilty on 7/8/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

// Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

// User Defaults
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"

// URL Constants
let BASE_URL = "https://anothersmack.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"
