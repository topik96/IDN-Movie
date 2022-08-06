//
//  SearchInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

enum SearchNavigationOption {
   
}

protocol SearchWireframeInterface: WireframeInterface {
    func navigate(to option: SearchNavigationOption)
}

protocol SearchViewInterface: ViewInterface {
    
}

protocol SearchPresenterInterface: PresenterInterface {
   
}

protocol SearchInteractorInterface: InteractorInterface {
   
}

