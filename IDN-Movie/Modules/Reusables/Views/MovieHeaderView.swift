//
//  MovieHeaderView.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import UIKit
import Kingfisher

struct MovieHeaderModel {
    var image: String?
    var title: String?
    var subtitle: String?
    var suplementary: String?
    var infoTitle: String?
    var infoSubtitle: String?
    var kindTitle: String?
    var kindSubtitle: String?
    var summaryTitle: String?
    var summarySubtitle: String?
}

class MovieHeaderView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var suplementaryLabel: UILabel!
    
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var infoSubtitleLabel: UILabel!
    
    @IBOutlet weak var kindTitleLabel: UILabel!
    @IBOutlet weak var kindSubtitleLabel: UILabel!
    
    @IBOutlet weak var summaryTitleLabel: UILabel!
    @IBOutlet weak var summarySubtitleLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        _commonInit()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        _commonInit()
    }
    
    private func _commonInit() {
        _ = fromNib(nibName: "MovieHeaderView")
        
        containerView.backgroundColor = IDNColor().getColor(.basicGray)
        imageView.layer.cornerRadius = 8
        titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        titleLabel.textColor = IDNColor().getColor(.basicWhite)
        
        subtitleLabel.font = .systemFont(ofSize: 14, weight: .medium)
        subtitleLabel.textColor = IDNColor().getColor(.basicWhite)
        
        suplementaryLabel.font = .systemFont(ofSize: 14, weight: .medium)
        suplementaryLabel.textColor = IDNColor().getColor(.basicWhite)
        
        infoTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        infoTitleLabel.textColor = IDNColor().getColor(.basicWhite)
        
        infoSubtitleLabel.font = .systemFont(ofSize: 12)
        infoSubtitleLabel.textColor = IDNColor().getColor(.basicWhite)
        
        kindTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        kindTitleLabel.textColor = IDNColor().getColor(.basicWhite)
        
        kindSubtitleLabel.font = .systemFont(ofSize: 12)
        kindSubtitleLabel.textColor = IDNColor().getColor(.basicWhite)
        
        summaryTitleLabel.font = .systemFont(ofSize: 16, weight: .bold)
        summaryTitleLabel.textColor = IDNColor().getColor(.basicWhite)
        
        summarySubtitleLabel.font = .systemFont(ofSize: 12)
        summarySubtitleLabel.textColor = IDNColor().getColor(.basicWhite)
    }
    
    func setupData(_ model: MovieHeaderModel) {
        imageView.kf.setImage(with: URL(string: model.image ?? ""))
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        suplementaryLabel.text = model.suplementary
        infoTitleLabel.text = model.infoTitle
        infoSubtitleLabel.text = model.infoSubtitle
        kindTitleLabel.text = model.kindTitle
        kindSubtitleLabel.text = model.kindSubtitle
        summaryTitleLabel.text = model.summaryTitle
        summarySubtitleLabel.text = model.summarySubtitle
    }
}
