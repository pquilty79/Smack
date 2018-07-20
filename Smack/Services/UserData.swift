//
//  UserData.swift
//  Smack
//
//  Created by Patrick Quilty on 7/14/18.
//  Copyright © 2018 Patrick Quilty. All rights reserved.
//

import Foundation

class UserDataService {
    
    static let instance = UserDataService()
    
    public private(set) var id = ""
    public private(set) var avatarColour = ""
    public private(set) var avatarName = ""
    public private(set) var email = ""
    public private(set) var name = ""
    
    func setUserData(id: String, colour: String, avatarName: String, email: String, name: String) {
        self.id = id
        self.avatarColour = colour
        self.avatarName = avatarName
        self.email = email
        self.name = name
    }
    
    func setAvatarName(avatarName: String) {
        self.avatarName = avatarName
    }
}
