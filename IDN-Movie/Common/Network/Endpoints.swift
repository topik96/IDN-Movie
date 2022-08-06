//
//  Endpoints.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

struct API {
    static let baseURL = IDNInfoPlist.baseURL
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints: Endpoint {
    case omdb
    
    var path: String {
        switch self {
        case .omdb:
            return ""
        }
    }
    
    var url: String {
        switch self {
        case .omdb:
            return API.baseURL
        }
    }
}
