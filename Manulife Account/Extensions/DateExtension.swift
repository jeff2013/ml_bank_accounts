//
//  DateExtension.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation

enum Format: String {
    case regular = "MMM dd, yyyy"
    case hashes = "yyyy-dd-mm"
}

extension DateFormatter {

    static func getFormatter(with format: Format) -> DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = format.rawValue
        return formatter
    }
    
    
}
