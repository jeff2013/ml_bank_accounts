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

class BankService {
    
    class func retrieveAccounts(completion: @escaping(DataResponse<[Account]>) -> Void) {
        let baseURL:String = "https://raw.githubusercontent.com/seyDoggy/ml-app-challenge/master/data/listOfAccounts.json"
        Alamofire.request(baseURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[Account]>) in
            completion(response)
        }
    }
    
//    class func getNearbyRestaurants(location: CLLocationCoordinate2D, radius: String, type: String, keyword: String, completion: @escaping(DataResponse<Places>) -> Void) {
//        let baseURL = "https://maps.googleapis.com/maps/api/place/nearbysearch/json?"
//
//        let parameters: [String: Any] = ["location": "\(location.latitude),\(location.longitude)", "radius": radius, "type": type, "keyword": keyword, "key": "AIzaSyBpVerz2iMPKNk864KkuzmC6UcMlPSPyDw"]
//
//        Alamofire.request(baseURL, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<Places>) in
//            print(response.request)
//            completion(response)
//        }
//    }
    
}
