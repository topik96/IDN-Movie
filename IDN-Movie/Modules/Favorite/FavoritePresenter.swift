//
//  FavoritePresenter.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class FavoritePresenter {
    
    // MARK: - Private Properties -
    
    private let _view: FavoriteViewInterface
    private let _interactor: FavoriteInteractorInterface
    private let _wireframe: FavoriteWireframeInterface
    
    var viewModel: FavoriteViewModel? {
        didSet {
            _view.reloadData()
        }
    }
    
    // MARK: - Life Cycle -
    
    init(view: FavoriteViewInterface,
         interactor: FavoriteInteractorInterface,
         wireframe: FavoriteWireframeInterface) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
    }
    
    private func _setupViewModel() {
        viewModel = FavoriteViewModel(movies: _prepareItems())
    }
    
    private func _prepareItems() -> [Movie] {
        let movies = CoreDataUtils.retrieveMovies()
        return movies.map { movieData in
            return Movie(title: movieData.title,
                         year: movieData.year,
                         poster: movieData.poster,
                         id: movieData.id,
                         type: MovieType(rawValue: movieData.type ?? ""))
        }
    }
    
}

// MARK: - Extensions -

extension FavoritePresenter: FavoritePresenterInterface {
    func viewWillAppear(animated: Bool) {
        _setupViewModel()
    }
    
    func didMovieItemTapped(movie: Movie) {
        _wireframe.navigate(to: .movieDetail(movie))
    }
}
