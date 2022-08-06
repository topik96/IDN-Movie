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
    
    // MARK: - Life Cycle -
    
    init(view: SearchViewInterface,
         interactor: SearchInteractorInterface,
         wireframe: SearchWireframeInterface) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
    }
}

// MARK: - Extensions -

extension SearchPresenter: SearchPresenterInterface {
    
}
