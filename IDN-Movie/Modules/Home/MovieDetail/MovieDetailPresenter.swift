//
//  MovieDetailPresenter.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class MovieDetailPresenter {
    
    // MARK: - Private Properties -
    
    private let _view: MovieDetailViewInterface
    private let _interactor: MovieDetailInteractorInterface
    private let _wireframe: MovieDetailWireframeInterface
    
    private var _movie: Movie?
    
    var movieHeaderModel: MovieHeaderModel? {
        didSet {
            _view.reloadData()
        }
    }
    
    // MARK: - Life Cycle -
    
    init(view: MovieDetailViewInterface,
         interactor: MovieDetailInteractorInterface,
         wireframe: MovieDetailWireframeInterface,
         movie: Movie?) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
        _movie = movie
    }
    
    private func _updateHeaderItem(_ movie: Movie) {
        movieHeaderModel = MovieHeaderModel(image: movie.poster,
                                            title: movie.title,
                                            subtitle: movie.year,
                                            suplementary: movie.genre,
                                            infoTitle: "Actors",
                                            infoSubtitle: movie.actors,
                                            kindTitle: "Writer",
                                            kindSubtitle: movie.writer,
                                            summaryTitle: "Plot",
                                            summarySubtitle: movie.plot)
    }
    
    private func _retrieveMovieDetail() {
        let paramRequest = MovieParamRequest(movieId: _movie?.id ?? "")
        _interactor.retrieveMovieDetail(paramRequest: paramRequest) { [weak self] (response, error) in
            guard let self = self else { return }
            self._handleMovieDetailResult(response, error)
        }
    }
    
    private func _handleMovieDetailResult(_ response: Movie?, _ error: Error?) {
        if let responseData = response {
            _updateHeaderItem(responseData)
        } else {
            if let err = error as NSError?, err.code == IDNErrorCode.noConnection.rawValue {
                self._wireframe.showNoNetworkAlert()
            } else {
                self._wireframe.showGeneralErrorAlert()
            }
        }
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    func viewDidLoad() {
        _retrieveMovieDetail()
    }
}
