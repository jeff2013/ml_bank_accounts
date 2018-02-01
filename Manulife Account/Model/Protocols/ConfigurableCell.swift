//
//  ConfigurableCell.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import Foundation

protocol ConfigurableTableViewCellProtocol {
    associatedtype configurableObject
    
    func configureCell(object: configurableObject)
}
