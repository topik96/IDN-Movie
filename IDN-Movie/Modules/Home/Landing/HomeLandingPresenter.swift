//
//  HomeLandingPresenter.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class HomeLandingPresenter {
    
    // MARK: - Private Properties -
    
    private let _view: HomeLandingViewInterface
    private let _interactor: HomeLandingInteractorInterface
    private let _wireframe: HomeLandingWireframeInterface
    
    private let _dispatchGroup = DispatchGroup()
    private var _seriesData = [Movie]()
    private var _moviesData = [Movie]()
    
    // MARK: - Internal Properties -
    
    var viewModel: HomeLandingViewModel? {
        didSet {
            _view.reloadData()
        }
    }
    
    var isLoading: Bool = false
    
    // MARK: - Life Cycle -
    
    init(view: HomeLandingViewInterface,
         interactor: HomeLandingInteractorInterface,
         wireframe: HomeLandingWireframeInterface) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
    }
    
    private func _setupViewModel() {
        viewModel = HomeLandingViewModel(series: _seriesData, movies: _moviesData)
    }
    
    private func _retrieveMovies() {
        let paramRequests: [MovieParamRequest] = [
            MovieParamRequest(searchTitle: "New", year: "2022", type: .series),
            MovieParamRequest(searchTitle: "New", year: "2022", type: .movie)
        ]
        isLoading = true
        for (index, paramRequest) in paramRequests.enumerated() {
            _dispatchGroup.enter()
            _interactor.retrieveMovieSearch(paramRequest: paramRequest, completion: { [weak self] (response, error) in
                guard let self = self else { return }
                self._handleMoviesResult(index == 0, response, error)
                self._dispatchGroup.leave()
            })
        }
    }

    private func _handleMoviesResult(_ isSeries: Bool, _ response: BaseSearch?, _ error: Error?) {
        if let responseData = response, let data = responseData.search {
            if isSeries {
                self._seriesData = data
            } else {
                self._moviesData = data
            }
        } else {
            if let err = error as NSError?, err.code == IDNErrorCode.noConnection.rawValue {
                self._wireframe.showNoNetworkAlert()
            } else {
                self._wireframe.showGeneralErrorAlert()
            }
        }
    }
    
}

extension HomeLandingPresenter: HomeLandingPresenterInterface {
    func viewDidLoad() {
        _retrieveMovies()
        _dispatchGroup.notify(queue: DispatchQueue.global()) { [weak self] in
            guard let self = self else { return }
            self.isLoading = false
            self._setupViewModel()
        }
    }
    
    func didPosterItemTapped(movie: Movie) {
        _wireframe.navigate(to: .movieDetail(movie))
    }
}
