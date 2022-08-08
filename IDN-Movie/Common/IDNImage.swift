//
//  IDNImage.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

enum IDNIcon {
    case logo
    case home
    case search
    case favorite
    case filter
    case saveRed
    case saveWhite
    case barSignal
    case sad
}

struct IDNImage {
    func getImage(_ icon: IDNIcon) -> UIImage? {
        switch icon {
        case .logo:
            return UIImage(named: "logo")
        case .home:
            return UIImage(named: "home")
        case .search:
            return UIImage(named: "search")
        case .favorite:
            return UIImage(named: "favorite")
        case .filter:
            return UIImage(named: "filter")
        case .saveRed:
            return UIImage(named: "saveRed")
        case .saveWhite:
            return UIImage(named: "saveWhite")
        case .barSignal:
            return UIImage(named: "barSignal")
        case .sad:
            return UIImage(named: "sad")
        }
    }
}
