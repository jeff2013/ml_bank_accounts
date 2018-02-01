//
//  Transaction.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation
import ObjectMapper

class Transaction: Mappable{
    
    var date: String!
    var activities: [Activity]!
    
    required init?(map: Map) {}
    func mapping(map: Map) {
        date <- map["date"]
        activities <- map["activity"]
    }
}
