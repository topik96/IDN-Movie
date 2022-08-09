//
//  MovieDetailWireframe.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class MovieDetailWireframe: BaseWireframe {
    
    // MARK: - Life Cycle -
    
    init(movie: Movie?) {
        let moduleViewController = MovieDetailViewController()
        super.init(viewController: moduleViewController)
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(view: moduleViewController, interactor: interactor, wireframe: self, movie: movie)
        moduleViewController.presenter = presenter
    }
}

extension MovieDetailWireframe: MovieDetailWireframeInterface {
    func navigate(to option: MovieDetailNavigationOption) {
        
    }
}
