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
    
    // MARK: - Life Cycle -
    
    init(view: FavoriteViewInterface,
         interactor: FavoriteInteractorInterface,
         wireframe: FavoriteWireframeInterface) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
    }
}

// MARK: - Extensions -

extension FavoritePresenter: FavoritePresenterInterface {
    
}
