//
//  ViewEmptyState.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 09/08/22.
//

import Foundation
import EmptyStateKit

enum ViewEmptyState: CustomState {

    case noData
    case noInternet

    var image: UIImage? {
        switch self {
        case .noData: return IDNImage().getImage(.noData)
        case .noInternet: return IDNImage().getImage(.barSignal)
        }
    }

    var title: String? {
        switch self {
        case .noData: return "No results"
        case .noInternet: return "No Connection"
        }
    }

    var description: String? {
        switch self {
        case .noData: return "No data to shown"
        case .noInternet: return "Please try again later"
        }
    }

    var titleButton: String? {
        return "Reload"
    }
}
