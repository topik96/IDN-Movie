//
//  SearchInteractor.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

final class SearchInteractor {
    private var _homeRemoteRepo = HomeLandingRemoteRepo()
}

// MARK: - Extensions -

extension SearchInteractor: SearchInteractorInterface {
    func retrieveMovieSearch(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<BaseSearch>) -> DataRequest {
        _homeRemoteRepo.retrieveMovieSearch(paramRequest: paramRequest, completion: completion)
    }
}
