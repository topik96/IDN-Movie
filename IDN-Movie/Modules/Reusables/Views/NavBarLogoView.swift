//
//  NavBarLogo.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import UIKit

class NavBarLogoView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        _commonInit()
    }

    private func _commonInit() {
        _ = fromNib(nibName: "NavBarLogoView", isInherited: true)
    }
}
