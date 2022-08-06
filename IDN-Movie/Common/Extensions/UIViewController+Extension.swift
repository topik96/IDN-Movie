//
//  UIViewController+Extension.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation
import UIKit

extension UIViewController {
    func topViewController(viewController: UIViewController? = UIApplication.shared.windows.first?.rootViewController) -> UIViewController? {
        if let tab = viewController as? UITabBarController {
            return tab
        }
        if let nav = viewController as? UINavigationController {
            return topViewController(viewController: nav.visibleViewController)
        }
        if let presented = viewController?.presentedViewController {
            return topViewController(viewController: presented)
        }
        return viewController
    }
}
