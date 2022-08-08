//
//  MovieCell.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import UIKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var sumplementaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _setupView()
    }
    
    private func _setupView() {
        selectionStyle = .none
        backgroundColor = .clear
        containerView.layer.cornerRadius = 8
        containerView.backgroundColor = IDNColor().getColor(.basicSoftGray)
        titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        titleLabel.textColor = IDNColor().getColor(.basicWhite)
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .medium)
        subtitleLabel.textColor = IDNColor().getColor(.basicWhite)
        sumplementaryLabel.font = .systemFont(ofSize: 16, weight: .medium)
        sumplementaryLabel.textColor = IDNColor().getColor(.basicWhite)
    }
    
    func setupData(image: String?, title: String?, subtitle: String?, suplementary: String?) {
        posterImageView.kf.setImage(with: URL(string: image ?? ""))
        titleLabel.text = title
        subtitleLabel.text = subtitle
        sumplementaryLabel.text = suplementary
    }
}
