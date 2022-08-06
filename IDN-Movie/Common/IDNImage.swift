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
    case noNetwork
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
        case .noNetwork:
            return UIImage(named: "")
        }
    }
}
