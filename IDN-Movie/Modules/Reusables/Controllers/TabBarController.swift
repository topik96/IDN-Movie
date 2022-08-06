//
//  TabBarController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    var didSelectItem: ((Int) -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.isTranslucent = false
        tabBar.unselectedItemTintColor = IDNColor().getColor(.basicWhite)
        tabBar.tintColor = IDNColor().getColor(.basicRed)
        tabBar.backgroundColor = IDNColor().getColor(.basicLightGray)
    }
}

extension TabBarController {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        didSelectItem?(item.tag)
    }
}
