//
//  Style.swift
//  Manulife Account
//
//  Created by Jeff Chang on 2018-02-01.
//  Copyright © 2018 jeff. All rights reserved.
//

import UIKit
import TextAttributes

indirect enum Style: Int {
    
    case navBarHeader
    case titleHeader
    case cellTitle
    case cellSubtitle
    case greyTitle19pt
    case balanceTitlePositive
    case balanceTitleNegative
    case greyRight19pt
    case greyMiddle14pt
    case greyLeft19pt
    case blueRight14pt
    case darkLeft15pt
    case balanceLargePositive
    case balanceLargeNegative
}

class StyleGuide {
    class func attributes(_ style: Style) -> TextAttributes {
        switch style {
        case .navBarHeader:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 17))
                .foregroundColor(UIColor(.whiteTwo))
                .backgroundColor(UIColor(.bluish))
                .alignment(.center)
        case .titleHeader:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 17))
                .foregroundColor(UIColor(.warmGrey))
                .alignment(.center)
        case .cellTitle:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 14))
                .foregroundColor(UIColor(.warmGrey))
                .alignment(.left)
        case .cellSubtitle:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 13))
                .foregroundColor(UIColor(.warmGrey))
                .alignment(.left)
        case .greyTitle19pt:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 19))
                .foregroundColor(UIColor(.darkTwo))
                .alignment(.left)
        case .balanceTitlePositive:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 22))
                .foregroundColor(UIColor(.ufoGreen))
                .alignment(.left)
        case .balanceTitleNegative:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 22))
                .foregroundColor(UIColor(.watermelon))
                .alignment(.left)
        case .greyRight19pt:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 19))
                .foregroundColor(UIColor(.warmGrey))
                .alignment(.right)
        case .greyLeft19pt:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 19))
                .foregroundColor(UIColor(.warmGrey))
                .alignment(.left)
        case .greyMiddle14pt:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 14))
                .foregroundColor(UIColor(.warmGrey))
                .alignment(.center)
        case .blueRight14pt:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 14))
                .foregroundColor(UIColor(.azureBlue))
                .alignment(.right)
        case .darkLeft15pt:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 15))
                .foregroundColor(UIColor(.darkTwo))
                .alignment(.left)
        case .balanceLargePositive:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 30))
                .foregroundColor(UIColor(.ufoGreen))
                .alignment(.center)
        case .balanceLargeNegative:
            return TextAttributes()
                .font(UIFont(.helveticaNeueMedium, size: 30))
                .foregroundColor(UIColor(.watermelon))
                .alignment(.center)
            
        }
    }
}

extension String{
    func styled(_ style: Style) -> NSAttributedString{
        return  NSAttributedString(string: self, attributes: StyleGuide.attributes(style))
    }
}
