//
//  MovieDetailRemoteRepo.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation
import Alamofire

final class MovieDetailRemoteRepo {
    struct MovieDetailConfig: APIConfig {
        var endpoint: String = Endpoints.omdb.url
        var params: Parameters?
        
        init(params: Parameters) {
            self.params = params
        }
    }
    
    @discardableResult
    func retrieveMovieDetail(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<Movie>) -> DataRequest {
        if let dictionary = paramRequest.dictionary {
            return APIService.getObject(setup: MovieDetailConfig(params: dictionary), completion: completion)
        }
        return Alamofire.request("//")
    }
}
