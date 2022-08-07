//
//  HomeLandingViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit
import Kingfisher
import SkeletonView

class HomeLandingViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties -
    private var _storedOffsets = [Int: CGFloat]()
    
    var presenter: HomeLandingPresenterInterface!
    
    // MARK: - Life Cycles -
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _setupNavigationBar()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupTableView()
        presenter.viewDidLoad()
    }
    
    private func _setupNavigationBar() {
       
    }
    
    private func _setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.rowHeight = 224
        tableView.register(UINib(nibName: String(describing: MovieCollectionCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieCollectionCell.self))
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
        tableView.isSkeletonable = true
        tableView.showAnimatedSkeleton()
    }
}

// MARK: - Extensions -

extension HomeLandingViewController: HomeLandingViewInterface {
    func reloadData() {
        Dispatch.main { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.tableView.hideSkeleton()
        }
    }
}

extension HomeLandingViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.viewModel?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModel?.items[section].rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: MovieCollectionCell.self, for: indexPath)
        cell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.section)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionTitle = presenter.viewModel?.items[section].sectionTitle else { return nil }
        let singleLabel = SingleLabel()
        singleLabel.label.text = sectionTitle
        return singleLabel
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return String(describing: MovieCollectionCell.self)
    }
}

extension HomeLandingViewController: SkeletonCollectionViewDataSource, SkeletonCollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let item = presenter.viewModel?.items[collectionView.tag] as? HomeLandingMovieItem else { return 0 }
        return item.model?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = presenter.viewModel?.items[collectionView.tag] as? HomeLandingMovieItem,
              let poster = item.model?[indexPath.item].poster else { return UICollectionViewCell() }
        let cell = collectionView.dequeueReusableCell(ofType: PosterCell.self, for: indexPath)
        if poster != "N/A" {
            cell.posterImageView.kf.setImage(with: URL(string: poster))
        } else {
            cell.posterImageView.image = IDNImage().getImage(.logo)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 145, height: 208)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = presenter.viewModel?.items[collectionView.tag] as? HomeLandingMovieItem,
              let model = item.model?[indexPath.item] else { return }
        presenter.didPosterItemTapped(movie: model)
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return String(describing: PosterCell.self)
    }
}


