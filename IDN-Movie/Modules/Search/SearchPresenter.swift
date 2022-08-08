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
    
    private func _retrieveMovies(_ title: String) {
        let param = MovieParamRequest(searchTitle: title, type: .series)
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
        if let responseData = response {
            _updateMovieItems(responseData.search ?? [])
        } else {
            if let err = error as NSError?, err.code == IDNErrorCode.noConnection.rawValue {
                self._wireframe.showNoNetworkAlert()
            } else {
                self._wireframe.showGeneralErrorAlert(error?.localizedDescription)
            }
        }
    }
}

// MARK: - Extensions -

extension SearchPresenter: SearchPresenterInterface {
    func viewDidLoad() {
        
    }
    
    func didSearchButtonTapped(title: String) {
        _retrieveMovies(title)
    }
    
    func didSelectItemTapped(movie: Movie) {
        _wireframe.navigate(to: .movieDetail(movie))
    }
}
