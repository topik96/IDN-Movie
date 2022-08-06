//
//  FavoriteViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class FavoriteViewController: BaseViewController {
    
    // MARK: - Properties -
    
    var presenter: FavoritePresenterInterface!
    
    // MARK: - Life Cycles -
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - Extensions -

extension FavoriteViewController: FavoriteViewInterface {
    
}
