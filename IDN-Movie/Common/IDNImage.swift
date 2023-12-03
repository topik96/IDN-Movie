//
//  IDNImage.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

enum IDNIcon: String {
    case logo
    case home
    case search
    case save
    case filter
    case saveRed
    case saveWhite
    case barSignal
    case sad
    case noData
    case trashRedFill
}

struct IDNImage {
    func getImage(_ icon: IDNIcon) -> UIImage? {
        return UIImage(named: icon.rawValue)
    }
}
