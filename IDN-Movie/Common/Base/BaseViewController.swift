//
//  BaseViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties -
    
    var statusBarView: UIView?
    
    // MARK: - Life Cycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupDefaultView()
    }
    
    private func _setupDefaultView() {
        _setupStatusBar()
        _setupNavigationBar()
        view.backgroundColor = IDNColor().getColor(.basicGray)
    }
    
    private func _setupStatusBar() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = IDNColor().getColor(.basicLightGray)
            view.addSubview(statusbarView)
            self.statusBarView = statusbarView
            
            statusbarView.translatesAutoresizingMaskIntoConstraints = false
            statusbarView.heightAnchor
                .constraint(equalToConstant: statusBarHeight).isActive = true
            statusbarView.widthAnchor
                .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
            statusbarView.topAnchor
                .constraint(equalTo: view.topAnchor).isActive = true
            statusbarView.centerXAnchor
                .constraint(equalTo: view.centerXAnchor).isActive = true
            
        } else {
            let statusBarView = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBarView?.backgroundColor = IDNColor().getColor(.basicLightGray)
            self.statusBarView = statusBarView
        }
    }
    
    private func _setupNavigationBar() {
        switch self {
        case is HomeLandingViewController, is SearchViewController, is FavoriteViewController:
            navigationItem.titleView = NavBarLogoView(frame: .zero)
        default:
            navigationItem.titleView = nil
        }
        tabBarController?.navigationController?.setNavigationBarHidden(true, animated: false)
        navigationController?.navigationBar.backgroundColor = IDNColor().getColor(.basicLightGray)
        navigationController?.navigationBar.barTintColor = IDNColor().getColor(.basicWhite)
        navigationController?.navigationBar.tintColor = IDNColor().getColor(.basicWhite)
    }
}
