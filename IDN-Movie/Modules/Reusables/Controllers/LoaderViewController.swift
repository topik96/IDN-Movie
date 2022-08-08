//
//  LoaderViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 09/08/22.
//

import Foundation
import UIKit

public class LoaderViewController: UIViewController {
    
    private static let shared: LoaderViewController = LoaderViewController()
    private var foregroundColor: UIColor!
    private var showsTransparentLayer: Bool!
    
    public static func show(showsTransparentLayer: Bool = false) {

        if shared.isViewLoaded && (shared.view.window != nil) {
            return
        }
        // Note: Do not remove, used to prevent multiple loader to be shown on same parent
        if shared.view.subviews.filter({$0.tag == 120934}).first != nil {
            return
        }
        
        shared.foregroundColor = IDNColor().getColor(.basicRed)
        shared.showsTransparentLayer = showsTransparentLayer
        
        initiateView()
    }
    
    public static func hide(completion: (() -> Void)? = nil) {
        setDefaultValue()
        if let loaderView: UIView = shared.view.subviews.filter({$0.tag == 120934}).first {
            loaderView.removeFromSuperview()
        }
        shared.dismiss(animated: true, completion: completion)
    }
    
    private static func setDefaultValue() {
        shared.foregroundColor = IDNColor().getColor(.basicRed)
        shared.showsTransparentLayer = false
    }
    
    private static func initiateView() {
        guard let topViewController = shared.topViewController() else { return }
        let loader = LoaderView()
        shared.view.backgroundColor = shared.showsTransparentLayer ? IDNColor().getColor(.basicLightGray).withAlphaComponent(0.6) : .clear
        loader.tag = 120934
        loader.foregroundColor = shared.foregroundColor
        loader.isAnimating = true
        shared.view.addSubview(loader)
        setupConstraint(loadView: loader, parentView: shared.view)
        shared.modalPresentationStyle = .overCurrentContext
        shared.modalTransitionStyle = .crossDissolve
        topViewController.present(shared, animated: true, completion: nil)
    }
    
    private static func setupConstraint(loadView: UIView, parentView view: UIView) {
        loadView.translatesAutoresizingMaskIntoConstraints = false
        loadView.widthAnchor.constraint(equalToConstant: 32).isActive = true
        loadView.heightAnchor.constraint(equalToConstant: 32).isActive = true
        loadView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loadView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
