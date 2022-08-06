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
    
    // MARK: - Life Cycle -
    
    init(view: HomeLandingViewInterface,
         interactor: HomeLandingInteractorInterface,
         wireframe: HomeLandingWireframeInterface) {
        _view = view
        _interactor = interactor
        _wireframe = wireframe
    }
}

extension HomeLandingPresenter: HomeLandingPresenterInterface {
    
}
