//
//  BaseWireframe.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

protocol WireframeInterface {
    func showNoNetworkAlert()
    func showGeneralErrorAlert()
}

extension WireframeInterface {
    func showNoNetworkAlert() {
        
    }
    
    func showGeneralErrorAlert() {
        
    }
}

class BaseWireframe {
    fileprivate var _viewController: UIViewController?
    
    init(viewController: UIViewController) {
        _viewController = viewController
    }
}

extension BaseWireframe {
    var viewController: UIViewController {
        return _viewController ?? UIViewController()
    }
    
    var navigationController: UINavigationController? {
        return viewController.navigationController
    }
    
    var tabBarController: UITabBarController? {
        return viewController.tabBarController
    }
}

extension BaseWireframe: WireframeInterface {
    func showGeneralErrorAlert() {
        
    }
    
    func showNoNetworkAlert() {
        
    }
}
