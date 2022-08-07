//
//  MovieCollectionCell.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import UIKit
import SkeletonView

class MovieCollectionCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        contentView.backgroundColor = .clear
        collectionView.backgroundColor = .clear
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 24, bottom: 16, right: 24)
        collectionView.register(UINib(nibName: String(describing: PosterCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: PosterCell.self))
    }
    
    func setCollectionViewDataSourceDelegate<D>(_ dataSourceDelegate: D, forRow row: Int) where D : UICollectionViewDataSource, D : UICollectionViewDelegate {
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.reloadData()
    }
}
