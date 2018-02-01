//
//  KeychainWrapper.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation

private let defaults = UserDefaults.standard

private let loginKey = "Launch"

func setLoginStatus(with value: Bool){
    defaults.set(value, forKey: loginKey)
}

//Returns T/F if we should show the launch/login screen
func isLoggedIn() -> Bool {
    if let status = defaults.value(forKey: loginKey) as? Bool {
        return status
    }
    return false
}
