//
//  KeychainWrapper.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation

class KeychainWrapper {

    static private let defaults = UserDefaults.standard
    
    static private let loginKey = "Launch"
    
    static func setLoginStatus(with value: Bool){
        defaults.set(value, forKey: loginKey)
    }
    
    //Returns T/F if we should show the launch/login screen
    static func isLoggedIn() -> Bool {
        if let status = defaults.value(forKey: loginKey) as? Bool {
            return status
        }
        print("shiet")
        return false
    }
}

