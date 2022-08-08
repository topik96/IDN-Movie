//
//  IDNColor.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

enum IDNColorName {
    case basicRed
    case basicWhite
    case basicSilver
    case basicGray
    case basicLightGray
    case basicBlack
    case basicSoftGray
}

struct IDNColor {
    func getColor(_ name: IDNColorName) -> UIColor {
        switch name {
        case .basicRed:
            return #colorLiteral(red: 0.8745098039, green: 0.3568627451, blue: 0.3450980392, alpha: 1)
        case .basicWhite:
            return #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        case .basicSilver:
            return #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        case .basicGray:
            return #colorLiteral(red: 0.07843137255, green: 0.09019607843, blue: 0.09803921569, alpha: 1)
        case .basicLightGray:
            return #colorLiteral(red: 0.1725490196, green: 0.1803921569, blue: 0.1882352941, alpha: 1)
        case .basicBlack:
            return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .basicSoftGray:
            return #colorLiteral(red: 0.1764705882, green: 0.2039215686, blue: 0.2117647059, alpha: 1)
        }
    }
}
