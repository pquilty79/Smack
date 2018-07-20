//
//  AuthService.swift
//  Smack
//
//  Created by Patrick Quilty on 7/13/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AuthService {
    static let instance = AuthService()
    let defaults = UserDefaults.standard
    var isLogged : Bool {
        get {
            return defaults.bool(forKey: LOGGED_IN_KEY)
        }
        set {
            defaults.set(newValue, forKey: LOGGED_IN_KEY)
        }
    }
    
    var authToken : String {
        get {
            return defaults.value(forKey: TOKEN_KEY) as! String
        }
        set {
            defaults.set(newValue, forKey: TOKEN_KEY)
        }
    }
    
    var userEmail : String {
        get {
            return defaults.value(forKey: USER_EMAIL) as! String
        }
        set {
            defaults.set(newValue, forKey: USER_EMAIL)
        }
    }
    
    func registerUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "email": lowerCaseEmail, "password": password
        ]
        Alamofire.request(URL_REGISTER, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseString { (response) in
            if response.result.error == nil {
                completion(true)
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    func loginUser(email: String, password: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "email": lowerCaseEmail, "password": password
        ]
        Alamofire.request(URL_LOGIN, method: .post, parameters: body, encoding: JSONEncoding.default, headers: HEADER).responseJSON { (response) in
            if response.result.error == nil {
                // Without SwiftyJSON
//                if let json = response.value as? Dictionary<String, Any> {
//                    if let email = json["user"] as? String {
//                        self.userEmail = email
//                    }
//                    if let token = json["token"] as? String {
//                        self.authToken = token
//                    }
//                }
                // Using SwiftyJSON Method 1
//                guard let data = response.data else { return }
//                do {
//                    let json = try JSON(data: data)
//                    self.userEmail = json["user"].stringValue
//                    self.authToken = json["token"].stringValue
//                } catch {
//                    debugPrint("Error converting to json object")
//                }
                // Using SwiftyJSON Method 2
//                guard let data = response.data else { return }
//                if let json = try? JSON(data: data) {
//                    self.userEmail = json["user"].stringValue
//                    self.authToken = json["token"].stringValue
//                }
                // Using SwiftyJSON Method 3
                guard let data = response.data,
                    let json = try? JSON(data: data) else {return}
                        self.userEmail = json["user"].stringValue
                        self.authToken = json["token"].stringValue
                // Next two lines end every version of this
                        self.isLogged = true
                        completion(true)
                } else {
                    completion(false)
                    debugPrint(response.result.error as Any)
            }
        }
    }
    func createUser(name: String, email: String, avatarName: String, avatarColour: String, completion: @escaping CompletionHandler) {
        let lowerCaseEmail = email.lowercased()
        let body: [String: Any] = [
            "name": name, "email": lowerCaseEmail, "avatarName": avatarName, "avatarColour": avatarColour
        ]
        let header = [
            "Authorization":"Bearer \(AuthService.instance.authToken)",
            "Content-Type" : "application/json; charset=utf-8"
        ]
        
    }
    
    
    
    
    
}
