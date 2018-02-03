//
//  ConnectivityWrapper.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-02.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation
import Alamofire

class Connectivity {
    
    class func isConnectedToInternet() -> Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
