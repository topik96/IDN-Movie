//
//  BottomSheetController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation
import UIKit

class BottomsheetController: UIViewController {
    fileprivate enum BottomsheetState {
        case hide(parentViewController: UIViewController? = nil)
        case show(parentViewController: UIViewController? = nil)
    }
    
    // MARK: - Private properties -
    private let _width: CGFloat = UIScreen.main.bounds.size.width
    private let _duration: (TimeInterval) = (0.3)
    private var _containerView = UIView()
    private var _outsideView = UIView()
    private var _contentView: UIView?
    private let _thresholdPercentage: CGFloat = 0.95
    private var _state: BottomsheetState = .hide() {
        didSet { newState(_state) }
    }
    
    var contentView: UIView?
    
    var isTapToDismiss: Bool = false {
        didSet {
            if isTapToDismiss {
                _configureGestureOutsideView()
            }
        }
    }
    
    fileprivate struct Drawing {
        fileprivate let itemleadingTrailingPadding = 0.0
        fileprivate let headerHeight = CGFloat(0.0)
        fileprivate let cornerRadius = CGFloat(4.0)
    }
    
    private struct Tokens {
        fileprivate var drawing = Drawing()
    }
    
    private var tokens: Tokens
    
    // :nodoc:
    init() {
        self.tokens = Tokens.init()
        super.init(nibName: nil, bundle: nil)
    }
    
    init(contentView: UIView) {
        self.tokens = Tokens.init()
        super.init(nibName: nil, bundle: nil)
        self.contentView = contentView
        _containerView.addSubview(self.contentView ?? UIView())
        updateHeight(contentView: contentView)
        view.addSubview(_outsideView)
        view.addSubview(_containerView)
        configureConstraints()
    }
    
    func updateHeight(contentView: UIView) {
        self.contentView?.anchor(top: _containerView.topAnchor,
                                 leading: _containerView.leadingAnchor,
                                 bottom: _containerView.bottomAnchor,
                                 trailing: _containerView.trailingAnchor,
                                 padding: .init(top: tokens.drawing.headerHeight, left: 0, bottom: 0, right: 0),
                                 size: .init(width: 0, height: self.calculateHeightFor(contentView: contentView)))
    }
    
    // :nodoc:
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.frame.size = UIScreen.main.bounds.size
        self._containerView.isHidden = true
    }
    
    // :nodoc:
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        switch _state {
        case .show:
            performPresentAnimation()
            _containerView.subviews[0].roundCorners(corners: [.topLeft, .topRight], radius: 10)
        default: break
        }
    }
    
    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        dismiss()
    }
    
    private func _configureGestureOutsideView() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismiss (_:)))
        self._outsideView.addGestureRecognizer(tapGesture)
    }
}

// MARK: - Private API's

private extension BottomsheetController {

    func calculateHeightFor(contentView: UIView) -> CGFloat {
        let contentViewHeight = contentView.frame.size.height
        let headerHeight = tokens.drawing.headerHeight
        // 95% of main screen height
        let availableHeight = _thresholdPercentage * UIScreen.main.bounds.height
        if contentViewHeight + headerHeight < availableHeight {
            return contentViewHeight
        } else {
            return availableHeight - headerHeight
        }
    }
    
    func performPresentAnimation() {
        if self._containerView.isHidden {
            self._containerView.isHidden = false
            self._containerView.translatesAutoresizingMaskIntoConstraints = true
            let yorigin = self._containerView.frame.origin.y
            self._containerView.frame.origin.y = UIScreen.main.bounds.size.height
            UIView.animate(withDuration: 0.3) { [weak self] in
                guard let self = self else { return }
                self._containerView.frame.origin.y = yorigin
            }
        }
    }
    
    func performDismissAnimation() {
        UIView.animate(withDuration: 0.3, animations: { [weak self] in
            guard let self = self else { return }
            self._containerView.frame.origin.y = UIScreen.main.bounds.size.height
        }, completion: { [weak self] (_) in
            guard let self = self else { return }
            self.contentView?.removeFromSuperview()
            self.contentView = nil
            self.dismiss(animated: true, completion: nil)
        })
    }
    
    func configureConstraints() {
        _containerView.anchor(top: nil,
                             leading: view.leadingAnchor,
                             bottom: view.bottomAnchor,
                             trailing: view.trailingAnchor)
        _outsideView.anchor(top: view.topAnchor,
                             leading: view.leadingAnchor,
                             bottom: view.bottomAnchor,
                             trailing: view.trailingAnchor)
    }
    
    func newState(_ state: BottomsheetController.BottomsheetState) {
        transform(state)
    }
    
    func transform(_ state: BottomsheetController.BottomsheetState) {
        switch state {
        case .show(let parentViewController):
            guard let topViewController = parentViewController ?? topViewController() else { return }
            self.view.backgroundColor = IDNColor().getColor(.basicBlack).withAlphaComponent(0.8)
            modalPresentationStyle = .overFullScreen
            self.modalTransitionStyle = .crossDissolve
            topViewController.present(self, animated: true)
        case .hide:
            performDismissAnimation()
        }
    }
}

// MARK: - Public API's
extension BottomsheetController {
    /// Present bottom sheet
    ///
    /// - Parameter sender: event trigerring object
    @objc func present(_ sender: UIViewController? = nil) {
        _state = .show(parentViewController: sender)
    }
    /// Dismiss bottom sheet
    ///
    /// - Parameter sender: event trigerring object
    @objc func dismiss(_ sender: UIViewController? = nil) {
        _state = .hide(parentViewController: sender)
    }
}
