//
//  SearchViewModel.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import Foundation

protocol SearchViewModelItem: ViewModelInterface {
    
}

struct SearchViewModelResultItem: SearchViewModelItem {
    var model: [Movie]?
    var rowCount: Int {
        return model?.count ?? 0
    }
}

struct SearchViewModel {
    var items = [SearchViewModelItem]()
    
    init(movies: [Movie]) {
        items.append(SearchViewModelResultItem(model: movies))
    }
}
