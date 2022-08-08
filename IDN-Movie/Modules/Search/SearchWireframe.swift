//
//  SearchWireframe.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class SearchWireframe: BaseWireframe {
    
    // MARK: - Life Cycle -
    
    init() {
        let moduleViewController = SearchViewController()
        super.init(viewController: moduleViewController)
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
}

// MARK: - Extensions -

extension SearchWireframe: SearchWireframeInterface {
    func navigate(to option: SearchNavigationOption) {
        switch option {
        case .movieDetail(let movie):
            navigationController?.pushWireframe(MovieDetailWireframe(movie: movie))
        }
    }
}
