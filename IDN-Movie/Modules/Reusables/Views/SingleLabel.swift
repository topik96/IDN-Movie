//
//  SingleLabel.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import UIKit

class SingleLabel: UIView {

    @IBOutlet weak var label: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        _commonInit()
    }

    private func _commonInit() {
        _ = fromNib(nibName: "SingleLabel")
        backgroundColor = IDNColor().getColor(.basicGray)
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = IDNColor().getColor(.basicWhite)
    }
}
