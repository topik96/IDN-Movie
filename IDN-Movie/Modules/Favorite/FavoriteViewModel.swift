//
//  FavoriteViewModel.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import Foundation

protocol FavoriteViewModelItem: ViewModelInterface {
    
}

struct FavoriteResultItem: FavoriteViewModelItem {
    var model: [Movie]?
    var rowCount: Int {
        return model?.count ?? 0
    }
}

struct FavoriteViewModel {
    var items = [FavoriteViewModelItem]()
    
    init(movies: [Movie]) {
        items.append(FavoriteResultItem(model: movies))
    }
}
