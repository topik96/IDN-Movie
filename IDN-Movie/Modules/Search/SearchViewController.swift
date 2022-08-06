//
//  SearchViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController {
    
    // MARK: - Properties -
    
    var presenter: SearchPresenterInterface!
    
    // MARK: - Life Cycles -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions -

extension SearchViewController: SearchViewInterface {
    
}
