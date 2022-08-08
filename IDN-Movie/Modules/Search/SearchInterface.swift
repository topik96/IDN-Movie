//
//  SearchInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

enum SearchNavigationOption {
    case movieDetail(Movie?)
}

protocol SearchWireframeInterface: WireframeInterface {
    func navigate(to option: SearchNavigationOption)
}

protocol SearchViewInterface: ViewInterface {
    func reloadData()
}

protocol SearchPresenterInterface: PresenterInterface {
    var viewModel: SearchViewModel? { get }
    func didSelectItemTapped(movie: Movie)
    func didSearchButtonTapped(title: String)
}

protocol SearchInteractorInterface: InteractorInterface {
    @discardableResult
    func retrieveMovieSearch(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<BaseSearch>) -> DataRequest
}

