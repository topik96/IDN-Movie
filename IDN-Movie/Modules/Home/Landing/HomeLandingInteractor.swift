//
//  HomeLandingInteractor.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

final class HomeLandingInteractor {
    private let _homeRemoteRepo = HomeLandingRemoteRepo()
}

extension HomeLandingInteractor: HomeLandingInteractorInterface {
    func retrieveMovieSearch(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<BaseSearch>) -> DataRequest {
        _homeRemoteRepo.retrieveMovieSearch(paramRequest: paramRequest, completion: completion)
    }
}
