//
//  UINavigationController+Extension.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

extension UINavigationController {
    func pushWireframe(_ wireframe: BaseWireframe, hideTabBar: Bool = false, animated: Bool = true) {
        let vc = wireframe.viewController
        vc.hidesBottomBarWhenPushed = hideTabBar
        if NetworkUtils.isConnectedToNetwork() {
            self.pushViewController(wireframe.viewController, animated: animated)
        } else {
            wireframe.showNoNetworkAlert()
        }
    }
    
    func setRootWireframe(_ wireframe: BaseWireframe, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }
}
