//
//  Account.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation
import ObjectMapper

class Account: Mappable {
    
    var id: Int!
    var displayName: String!
    var accountNumber: String!
    var balance: Double!
    
    required init?(map: Map) {}
    
    init(displayName: String, balance: Double) {
        self.displayName = displayName
        self.balance = balance
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        displayName <- map["display_name"]
        accountNumber <- map["account_number"]
        balance <- map["balance"]
    }
}
