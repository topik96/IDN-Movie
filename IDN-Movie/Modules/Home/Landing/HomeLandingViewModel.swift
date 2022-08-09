//
//  HomeLandingViewModel.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation

protocol HomeLandingViewModelItem: ViewModelInterface {
   
}

struct HomeLandingMovieItem: HomeLandingViewModelItem {
    var sectionTitle: String?
    var model: [Movie]?
    var rowCount: Int {
        return 1
    }
}

struct HomeLandingViewModel {
    var items = [HomeLandingViewModelItem]()
    
    init(series: [Movie], movies: [Movie]) {
        if series.count > 0 && movies.count > 0 {
            items.append(HomeLandingMovieItem(sectionTitle: "New Series", model: series))
            items.append(HomeLandingMovieItem(sectionTitle: "Movies", model: movies))
        }
    }
}
