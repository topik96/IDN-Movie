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
    
    // MARK: - Life Cycle -
    
    init(view: MovieDetailViewInterface,
         interactor: MovieDetailInteractorInterface,
         wireframe: MovieDetailWireframeInterface) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
    }
}

extension MovieDetailPresenter: MovieDetailPresenterInterface {
    
}