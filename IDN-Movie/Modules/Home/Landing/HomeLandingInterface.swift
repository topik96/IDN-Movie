//
//  HomeLandingInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

enum HomeLandingNavigationOption {
    case movieDetail(Movie)
}

protocol HomeLandingWireframeInterface: WireframeInterface {
    func navigate(to option: HomeLandingNavigationOption)
}

protocol HomeLandingViewInterface: ViewInterface {
    func reloadData()
}

protocol HomeLandingPresenterInterface: PresenterInterface {
    var viewModel: HomeLandingViewModel? { get }
    var isLoading: Bool { get }
    func didPosterItemTapped(movie: Movie)
}

protocol HomeLandingInteractorInterface: InteractorInterface {
    @discardableResult
    func retrieveMovieSearch(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<BaseSearch>) -> DataRequest
}

