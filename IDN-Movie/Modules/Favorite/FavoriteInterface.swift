//
//  FavoriteInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

enum FavoriteNavigationOption {
   
}

protocol FavoriteWireframeInterface: WireframeInterface {
    func navigate(to option: FavoriteNavigationOption)
}

protocol FavoriteViewInterface: ViewInterface {
    
}

protocol FavoritePresenterInterface: PresenterInterface {
   
}

protocol FavoriteInteractorInterface: InteractorInterface {
   
}

