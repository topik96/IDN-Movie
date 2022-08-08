//
//  Rating.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import Foundation

struct Rating: Codable {
    var source, value: String?
    
    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}
