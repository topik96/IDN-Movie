//
//  MovieDetaillViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class MovieDetailViewController: BaseViewController {
    
    // MARK: - Properties -
    
    var presenter: MovieDetailPresenterInterface!
    
    // MARK: - Life Cycles -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions -

extension MovieDetailViewController: MovieDetailViewInterface {
    
}
