//
//  Search.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation

struct BaseSearch: Codable {
    var search: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case search = "Search"
    }
}

