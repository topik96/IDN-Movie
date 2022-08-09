//
//  ErrorView.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 09/08/22.
//

import Foundation
import UIKit

class ErrorView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var primaryButton: PrimaryButton!
    
    var didButtonTapped: ButtonEventHandler?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _commonInit()
    }
    
    private func _commonInit() {
        _ = fromNib(nibName: "ErrorView")
        backgroundColor = IDNColor().getColor(.basicSoftGray)
        titleLabel.font = .systemFont(ofSize: 22, weight: .bold)
        titleLabel.textColor = IDNColor().getColor(.basicWhite)
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        subtitleLabel.textColor = IDNColor().getColor(.basicWhite)
        primaryButton.addTarget(self, action: #selector(_didButtonTapped), for: .touchUpInside)
    }
    
    func setupData(image: UIImage?, title: String?, subtitle: String?, buttonTitle: String? = "Close") {
        imageView.image = image
        titleLabel.text = title
        subtitleLabel.text = subtitle
        primaryButton.setTitle(buttonTitle, for: .normal)
    }
    
    @objc private func _didButtonTapped() {
        didButtonTapped?()
    }
}
