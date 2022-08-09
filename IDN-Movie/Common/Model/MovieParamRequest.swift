//
//  MovieParamRequest.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation

struct MovieParamRequest: Codable {
    var movieId: String?
    var searchTitle: String?
    var year: String?
    var type: MovieType?
    var apiKey: String = IDNInfoPlist.apiKey
    
    enum CodingKeys: String, CodingKey {
        case movieId = "i"
        case searchTitle = "s"
        case year = "y"
        case type
        case apiKey = "apikey"
    }
}
