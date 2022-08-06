//
//  HomeLandingInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

enum HomeLandingNavigationOption {
   
}

protocol HomeLandingWireframeInterface: WireframeInterface {
    func navigate(to option: HomeLandingNavigationOption)
}

protocol HomeLandingViewInterface: ViewInterface {
    
}

protocol HomeLandingPresenterInterface: PresenterInterface {
   
}

protocol HomeLandingInteractorInterface: InteractorInterface {
   
}

