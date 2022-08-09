//
//  MovieDetailInteractor.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

final class MovieDetailInteractor {
    private var _movieDetailRemoteRepo = MovieDetailRemoteRepo()
}

extension MovieDetailInteractor: MovieDetailInteractorInterface {
    func retrieveMovieDetail(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<Movie>) -> DataRequest {
        _movieDetailRemoteRepo.retrieveMovieDetail(paramRequest: paramRequest, completion: completion)
    }
}
