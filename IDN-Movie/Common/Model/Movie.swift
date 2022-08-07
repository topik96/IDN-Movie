//
//  Movie.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation

struct Movie: Codable {
    var id: String?
    var title: String?
    var year: String?
    var poster: String?
    var type: MovieType?
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case poster = "Poster"
        case type = "Type"
    }
}

enum MovieType: String, Codable {
    case movie
    case series
    case episode
}
