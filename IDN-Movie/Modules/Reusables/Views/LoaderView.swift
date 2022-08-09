//
//  LoaderView.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 09/08/22.
//

import Foundation
import UIKit

class LoaderView: UIView {
    
    var foregroundColor: UIColor! {
        didSet {
            setNeedsLayout()
        }
    }
    
    var lineWidth: CGFloat = 3.0 {
        didSet {
            setNeedsLayout()
        }
    }

    var isAnimating = false {
        didSet {
            isHidden = !isAnimating
            if isAnimating {
                _animate(duration: duration)
            } else {
                layer.removeAllAnimations()
            }
        }
    }
    
    var duration: CFTimeInterval = 1

    override init(frame: CGRect) {
        super.init(frame: frame)
        _setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        _setup()
    }

    private func _setup() {
        backgroundColor = .clear
        lineWidth = 4.0
    }

    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        let radius = (min(width, height) - lineWidth) / 2.0

        var currentPoint = CGPoint(x: width / 2.0 + radius, y: height / 2.0)
        var priorAngle = CGFloat(360)

        for angle in stride(from: CGFloat(360), through: 0, by: -2) {
            let path = UIBezierPath()
            path.lineWidth = lineWidth
            path.lineCapStyle = .round

            path.move(to: currentPoint)
            currentPoint = CGPoint(x: width / 2.0 + cos(angle * .pi / 180.0) * radius, y: height / 2.0 + sin(angle * .pi / 180.0) * radius)
            path.addArc(withCenter: CGPoint(x: width / 2.0, y: height / 2.0), radius: radius, startAngle: priorAngle * .pi / 180.0 , endAngle: angle * .pi / 180.0, clockwise: false)
            priorAngle = angle

            foregroundColor.withAlphaComponent(angle / (360.0 * lineWidth)).setStroke()
            path.stroke()
        }
    }
    
    private func _animate(duration: CFTimeInterval = 3) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat.pi * 2
        rotateAnimation.isRemovedOnCompletion = false
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = .infinity
        layer.add(rotateAnimation, forKey: nil)
    }
}
