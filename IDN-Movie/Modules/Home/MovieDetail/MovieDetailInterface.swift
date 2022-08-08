//
//  MovieDetailInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

enum MovieDetailNavigationOption {
   
}

protocol MovieDetailWireframeInterface: WireframeInterface {
    func navigate(to option: MovieDetailNavigationOption)
}

protocol MovieDetailViewInterface: ViewInterface {
    func reloadData()
}

protocol MovieDetailPresenterInterface: PresenterInterface {
    var movieHeaderModel: MovieHeaderModel? { get }
}

protocol MovieDetailInteractorInterface: InteractorInterface {
    @discardableResult
    func retrieveMovieDetail(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<Movie>) -> DataRequest
}


