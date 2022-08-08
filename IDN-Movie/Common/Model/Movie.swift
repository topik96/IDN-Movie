//
//  Movie.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation

struct Movie: Codable {
    var title, year, rated, released: String?
    var runtime, genre, director, writer: String?
    var actors, plot, language, country: String?
    var awards: String?
    var poster: String?
    var ratings: [Rating]?
    var metascore, imdbRating, imdbVotes, id: String?
    var totalSeasons, response: String?
    var type: MovieType?
    
    enum CodingKeys: String, CodingKey {
        case id = "imdbID"
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating, imdbVotes
        case type = "Type"
        case totalSeasons
        case response = "Response"
    }
}

enum MovieType: String, Codable {
    case movie
    case series
    case episode
}
