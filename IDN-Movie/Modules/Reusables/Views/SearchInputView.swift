//
//  SearchInputView.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import UIKit

class SearchInputView: UIView {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var didFilterTapped: ButtonEventHandler?
    var didSearchButtonTapped: ButtonEventWithParameterHandler?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        _commonInit()
    }

    private func _commonInit() {
        _ = fromNib(nibName: "SearchInputView", isInherited: true)
        backgroundColor = IDNColor().getColor(.basicLightGray)
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(
            string: "Type Movie Title...",
            attributes: [NSAttributedString.Key.foregroundColor: IDNColor().getColor(.basicSilver)]
        )
        textField.returnKeyType = .search
        textField.backgroundColor = IDNColor().getColor(.basicGray)
        textField.textColor = IDNColor().getColor(.basicWhite)
        textField.becomeFirstResponder()
        imageView.image = IDNImage().getImage(.filter)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = IDNColor().getColor(.basicRed)
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                              action: #selector(_didFilterTapped)))
    }
    
    @objc private func _didFilterTapped() {
        didFilterTapped?()
    }
}

// MARK: - Extensions -
extension SearchInputView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        didSearchButtonTapped?(textField.text ?? "")
        return true
    }
}