//
//  AppDelegate.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 05/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        setNavigationBarAppearance()
        setTabbarAsRoot()
        
        return true
    }
}

// MARK: - Extensions -
extension AppDelegate {
    func setTabbarAsRoot() {
        let initialController = UINavigationController()
        initialController.setRootWireframe(TabBarControllerWireframe())
        window?.rootViewController = initialController
        window?.makeKeyAndVisible()
    }
    
    func setNavigationBarAppearance() {
        if #available(iOS 15.0, *) {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.configureWithTransparentBackground()
            UINavigationBar.appearance().standardAppearance = navigationBarAppearance
            UINavigationBar.appearance().compactAppearance = navigationBarAppearance
            UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        }
    }
}

