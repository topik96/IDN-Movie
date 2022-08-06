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
        var method: HTTPMethod = .get
        var params: Parameters? = nil
        var encoding: ParameterEncoding = URLEncoding.default
        var headers: HTTPHeaders = [:]
    }
    
//    @discardableResult
//    func retrieveMoviSearch(completion: IDNResponse<ResponseObject>) -> DataRequest {
//        return APIService.getObject(setup: HomeLandingConfig(), completion: completion)
//    }
}
