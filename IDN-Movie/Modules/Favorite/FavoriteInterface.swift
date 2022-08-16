//
//  FavoriteInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

enum FavoriteNavigationOption {
    case movieDetail(Movie)
}

protocol FavoriteWireframeInterface: WireframeInterface {
    func navigate(to option: FavoriteNavigationOption)
}

protocol FavoriteViewInterface: ViewInterface {
    func reloadData()
}

protocol FavoritePresenterInterface: PresenterInterface {
    var viewModel: FavoriteViewModel? { get }
    func didMovieItemTapped(movie: Movie)
    func didDeleteMovieItem(movie: Movie)
}

protocol FavoriteInteractorInterface: InteractorInterface {
   
}

