//
//  BankService.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

enum AccountTypes: Int {
    case chequing = 10
    case savings = 12
    case investments = 19
    
    func urlExtension() -> String {
        switch self {
        case .chequing:
            return "chequingAccount.json"
        case .savings:
            return "savingsAccount.json"
        case .investments:
            return "TfsaAccount.json"
        }
    }
}

class BankService {
    
    class func retrieveAccounts(completion: @escaping(DataResponse<[Account]>) -> Void) {
        let baseURL:String = "https://raw.githubusercontent.com/seyDoggy/ml-app-challenge/master/data/listOfAccounts.json"
        Alamofire.request(baseURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[Account]>) in
            completion(response)
        }
    }
    
    class func retrieveTransactions(for account: AccountTypes, completion: @escaping(DataResponse<[Transaction]>) -> Void) {
        let baseURL:String = "https://raw.githubusercontent.com/seyDoggy/ml-app-challenge/master/data/" + account.urlExtension()
        Alamofire.request(baseURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[Transaction]>) in
            completion(response)
        }
    }
}
