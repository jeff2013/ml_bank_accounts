//
//  DoubleExtension.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation

extension Double {
    
    func formatCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedCurrency = formatter.string(from: self as NSNumber) {
            return formattedCurrency
        }
        return ""
    }
}
