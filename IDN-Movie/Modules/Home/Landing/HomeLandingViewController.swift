//
//  HomeLandingViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class HomeLandingViewController: BaseViewController {
    
    // MARK: - Properties -
    
    var presenter: HomeLandingPresenterInterface!
    
    // MARK: - Life Cycles -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupNavigationBar()
    }
    
    private func _setupNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBarController?.navigationController?.navigationBar.backgroundColor = IDNColor().getColor(.basicLightGray)
        tabBarController?.navigationItem.titleView = NavBarLogoView(frame: .zero)
    }
}

// MARK: - Extensions -

extension HomeLandingViewController: HomeLandingViewInterface {
    
}
