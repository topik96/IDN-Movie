//
//  FavoriteWireframe.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class FavoriteWireframe: BaseWireframe {
    
    // MARK: - Life Cycle -
    
    init() {
        let moduleViewController = FavoriteViewController()
        super.init(viewController: moduleViewController)
        let interactor = FavoriteInteractor()
        let presenter = FavoritePresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
}

// MARK: - Extensions -

extension FavoriteWireframe: FavoriteWireframeInterface {
    func navigate(to option: FavoriteNavigationOption) {
        
    }
}
