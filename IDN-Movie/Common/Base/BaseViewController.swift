//
//  BaseViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit
import EmptyStateKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties -
    
    var statusBarView: UIView?
    
    private var _emptyView: UIView?
    
    // MARK: - Life Cycle -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupDefaultView()
        setupViewEmptyState(in: view)
    }
    
    // MARK: - Private Functions -
    
    private func _setupDefaultView() {
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
    
    // MARK: - Internal Functions -
    
    func setupViewEmptyState(in view: UIView) {
        var format = EmptyStateFormat()
        format.backgroundColor = IDNColor().getColor(.basicGray)
        format.imageSize = CGSize(width: 150, height: 150)
        format.verticalMargin = 0
        format.titleAttributes = [.foregroundColor: IDNColor().getColor(.basicWhite)]
        format.descriptionAttributes = [.foregroundColor: IDNColor().getColor(.basicWhite)]
        format.buttonColor = IDNColor().getColor(.basicRed)
        
        _emptyView = view
        _emptyView?.emptyState.format = format
        _emptyView?.emptyState.delegate = self
        _emptyView?.emptyState.dataSource = self
        _setupStatusBar()
    }
    
    func didEmptyStateButtonTapped() {
        // Override function...
    }
}

// MARK: - Extensions -

extension BaseViewController: EmptyStateDataSource, EmptyStateDelegate {
    func imageForState(_ state: CustomState, inEmptyState emptyState: EmptyState) -> UIImage? {
        let viewState = state as! ViewEmptyState
        return viewState.image
    }
    
    func titleForState(_ state: CustomState, inEmptyState emptyState: EmptyState) -> String? {
        let viewState = state as! ViewEmptyState
        return viewState.title
    }
    
    func descriptionForState(_ state: CustomState, inEmptyState emptyState: EmptyState) -> String? {
        let viewState = state as! ViewEmptyState
        return viewState.description
    }
    
    func titleButtonForState(_ state: CustomState, inEmptyState emptyState: EmptyState) -> String? {
        let viewState = state as! ViewEmptyState
        return viewState.titleButton
    }
    
    func emptyState(emptyState: EmptyState, didPressButton button: UIButton) {
        _emptyView?.emptyState.hide()
        didEmptyStateButtonTapped()
    }
}

extension BaseViewController: ViewInterface {
    func setEmptyState(_ state: ViewEmptyState) {
        _emptyView?.emptyState.show(state)
    }
}

