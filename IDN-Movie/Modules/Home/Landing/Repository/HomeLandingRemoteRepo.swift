//
//  HomeLandingRemoteRepo.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

final class HomeLandingRemoteRepo {
    struct HomeLandingConfig: APIConfig {
        var endpoint: String = Endpoints.omdb.url
        var params: Parameters?
        
        init(params: Parameters) {
            self.params = params
        }
    }
    
    @discardableResult
    func retrieveMovieSearch(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<BaseSearch>) -> DataRequest {
        if let dictionary = paramRequest.dictionary {
            return APIService.getObject(setup: HomeLandingConfig(params: dictionary), completion: completion)
        }
        return Alamofire.request("//")
    }
}
