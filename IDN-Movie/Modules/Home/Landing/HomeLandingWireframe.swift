//
//  HomeLandingWireframe.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class HomeLandingWireframe: BaseWireframe {
    
    // MARK: - Life Cycle -
    
    init() {
        let moduleViewController = HomeLandingViewController()
        super.init(viewController: moduleViewController)
        let interactor = HomeLandingInteractor()
        let presenter = HomeLandingPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
}

extension HomeLandingWireframe: HomeLandingWireframeInterface {
    func navigate(to option: HomeLandingNavigationOption) {
        
    }
}
