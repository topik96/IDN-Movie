//
//  ViewInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit
import EmptyStateKit

protocol ViewInterface {
    func setEmptyState(_ state: ViewEmptyState)
    func hideProgressHUD(view: UIView)
    func hideProgressHUD(completion: (() -> Void)?)
    func showProgressHUD(showsTransparentLayer: Bool)
}

// MARK: - Extensions -

extension ViewInterface {
    func setEmptyState(_ state: ViewEmptyState) { }
    
    func hideProgressHUD(view: UIView) { }
    
    func showProgressHUD(showsTransparentLayer: Bool = false) {
        Dispatch.main {
            LoaderViewController.show(showsTransparentLayer: showsTransparentLayer)
        }
    }
    
    func hideProgressHUD(completion: (() -> Void)? = nil) {
        Dispatch.main {
            LoaderViewController.hide(completion: completion)
        }
    }
}

