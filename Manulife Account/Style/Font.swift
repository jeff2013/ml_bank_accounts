//
//  Font.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit
import TextAttributes

extension UIFont{
    enum FontBook: String {
        case helveticaNeueLight     = "HelveticaNeue-Light"
        case helveticaNeueMedium    = "HelveticaNeue-Medium"
        case helveticaNeue          = "HelveticaNeue"
        case helveticaNeueBold      = "HelveticaNeue-Bold"
        
    }
    
    convenience init(_ appFont: FontBook, size fontSize: CGFloat){
        self.init(name: appFont.rawValue, size: fontSize)!
    }
}
