//
//  DoubleExtension.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation

enum TransactionType {
    case none
    case withdrawal
}

extension Double {
    
    func formatCurrency(of type: TransactionType) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currency
        if let formattedCurrency = formatter.string(from: self as NSNumber) {
            switch type {
            case .none:
                return formattedCurrency
            case .withdrawal:
                return "-\(formattedCurrency)"
            }
        }
        return ""
    }
}
