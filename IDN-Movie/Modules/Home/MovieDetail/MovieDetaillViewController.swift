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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.backgroundColor = IDNColor().getColor(.basicLightGray)
    }
}

// MARK: - Extensions -

extension MovieDetailViewController: MovieDetailViewInterface {
    
}
