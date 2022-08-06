//
//  PrimaryButton.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import UIKit

public typealias ButtonEventHandler = () -> Void

public struct ButtonModel {
    let titleText: String?
    let buttonHandler: ButtonEventHandler?
    
    public init(titleText: String?, buttonHandler: ButtonEventHandler?) {
        self.titleText = titleText
        self.buttonHandler = buttonHandler
    }
}

class PrimaryButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _commonInit()
    }

    private func _commonInit() {
        if #available(iOS 15, *) {
            configuration = nil
        }
        layer.cornerRadius = frame.height / 2
        backgroundColor = IDNColor().getColor(.basicRed)
        setTitleColor(IDNColor().getColor(.basicWhite), for: .normal)
    }
    

    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        _pulsate()
        return super.beginTracking(touch, with: event)
    }
    
    private func _pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.4
        pulse.fromValue = 0.98
        pulse.toValue = 1.0
        pulse.autoreverses = false
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        layer.add(pulse, forKey: nil)
    }
}

