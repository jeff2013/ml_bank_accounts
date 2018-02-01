//
//  Transaction.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation
import ObjectMapper

class Activity: Mappable {
    
    var id: Int!
    var date: String!
    var description: String!
    var withdrawalAmount: Double!
    var depositAmount: Double!
    var balance: Double!
    var transactionID: Int! 
    
    //"date": "2016-12-22",
    
    required init?(map: Map) {}

    func mapping(map: Map) {
        id <- map["id"]
        date <- map["date"]
        description <- map["description"]
        withdrawalAmount <- map["withdrawal_amount"]
        depositAmount <- map["deposit_amount"]
        balance <- map["balance"]
        transactionID <- map["transaction_uid"]
    }
}
