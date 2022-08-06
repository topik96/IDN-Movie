//
//  TabBarControllerWireframe.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

final class TabBarControllerWireframe: BaseWireframe {
    private let _moduleViewController = TabBarController()
    private var _tabBarItemViewModels = [TabBarItemViewModel]()
    
    init() {
        super.init(viewController: _moduleViewController)
        _setupTabBarItems()
    }
    
    private func _setupTabBarItems() {
        _tabBarItemViewModels = [
            TabBarItemViewModel(title: "Home",
                                image: IDNImage().getImage(.home),
                                wireframe: HomeLandingWireframe()),
            TabBarItemViewModel(title: "Search",
                                image: IDNImage().getImage(.search),
                                wireframe: SearchWireframe()),
            TabBarItemViewModel(title: "Favorite",
                                image: IDNImage().getImage(.favorite),
                                wireframe: FavoriteWireframe())
        ]
        
        _moduleViewController.viewControllers = _tabBarItemViewModels.map {
            UINavigationController(rootViewController: $0.wireframe.viewController)
        }
        
        _initializeTabBarItem(moduleViewController: _moduleViewController)
    }
    
    private func _initializeTabBarItem(moduleViewController: TabBarController) {
        for (index, viewController) in (moduleViewController.viewControllers ?? []).enumerated() {
            let item = _tabBarItemViewModels[index]
            viewController.tabBarItem = UITabBarItem(title: item.title,
                                                     image: item.image,
                                                     tag: index)
        }
    }
}
