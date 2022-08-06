//
//  BaseViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Life Cycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupDefaultView()
    }
    
    private func _setupDefaultView() {
        _setupStatusBar()
        view.backgroundColor = IDNColor().getColor(.basicGray)
    }
    
    private func _setupStatusBar() {
        if #available(iOS 13.0, *) {
            let app = UIApplication.shared
            let statusBarHeight: CGFloat = app.statusBarFrame.size.height
            
            let statusbarView = UIView()
            statusbarView.backgroundColor = IDNColor().getColor(.basicLightGray)
            view.addSubview(statusbarView)
            
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
            let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
            statusBar?.backgroundColor = IDNColor().getColor(.basicLightGray)
        }
    }
}
