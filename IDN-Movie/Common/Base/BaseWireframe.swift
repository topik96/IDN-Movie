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
    func showGeneralErrorAlert(_ message: String?)
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
    func showGeneralErrorAlert(_ message: String?) {
        let contentView = ErrorView()
        let bottomSheet = BottomsheetController(contentView: contentView)
        contentView.setupData(image: IDNImage().getImage(.sad),
                              title: "Unfortunately",
                              subtitle: message)
        contentView.didButtonTapped = {
            bottomSheet.dismiss()
        }
        bottomSheet.present(_viewController)
    }
    
    func showNoNetworkAlert() {
        let contentView = ErrorView()
        let bottomSheet = BottomsheetController(contentView: contentView)
        contentView.setupData(image: IDNImage().getImage(.barSignal),
                              title: "No Connection",
                              subtitle: "Makesure that you have a good network connection")
        contentView.didButtonTapped = {
            bottomSheet.dismiss()
        }
        bottomSheet.present(_viewController)
    }
}
