//
//  SearchPresenter.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class SearchPresenter {
    
    // MARK: - Private Properties -
    
    private let _view: SearchViewInterface
    private let _interactor: SearchInteractorInterface
    private let _wireframe: SearchWireframeInterface
    
    private var _title: String?
    private var _year: String?
    private var _type: MovieType?
    
    var viewModel: SearchViewModel? {
        didSet {
            _view.reloadData()
        }
    }
    
    // MARK: - Life Cycle -
    
    init(view: SearchViewInterface,
         interactor: SearchInteractorInterface,
         wireframe: SearchWireframeInterface) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
    }
    
    private func _updateMovieItems(_ movies: [Movie]) {
        viewModel = SearchViewModel(movies: movies)
    }
    
    private func _retrieveMovies() {
        let param = MovieParamRequest(searchTitle: _title, year: _year, type: _type)
        _view.showProgressHUD(showsTransparentLayer: true)
        _interactor.retrieveMovieSearch(paramRequest: param, completion: { [weak self] (response, error) in
            guard let self = self else { return }
            self._view.hideProgressHUD { [weak self] in
                guard let self = self else { return }
                self._handleMoviesResult(response, error)
            }
        })
    }
    
    private func _handleMoviesResult(_ response: BaseSearch?, _ error: Error?) {
        if let responseData = response, let data = responseData.search {
            _updateMovieItems(data)
        } else {
            if let err = error as NSError?, err.code == IDNErrorCode.noConnection.rawValue {
                _wireframe.showNoNetworkAlert()
            } else {
                _wireframe.showGeneralErrorAlert(error?.localizedDescription)
            }
            _view.setEmptyState(.noData)
        }
    }
}

// MARK: - Extensions -

extension SearchPresenter: SearchPresenterInterface {
    func didUpdateSearchInput(title: String) {
        _title = title
    }
    
    func didSearchButtonTapped(title: String) {
        _retrieveMovies()
    }
    
    func didSelectItemTapped(movie: Movie) {
        _wireframe.navigate(to: .movieDetail(movie))
    }
    
    func didFilterButtonTapped() {
        if _title == nil {
            _wireframe.navigate(to: .emptyTitle)
        } else {
            let handler: ButtonEventWithParameterHandler? = { [weak self] data in
                guard let self = self, let data = data as? MovieParamRequest else { return }
                self._type = data.type
                self._year = data.year
                self._retrieveMovies()
            }
            _wireframe.navigate(to: .filterMovie(handler))
        }
    }
}
