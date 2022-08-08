//
//  MovieDetaillViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit
import SkeletonView
import Kingfisher

class MovieDetailViewController: BaseViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var footerView: UIView!
    
    // MARK: - Properties -
    
    private let _topInset = 165.0

    var presenter: MovieDetailPresenterInterface!
    
    // MARK: - Life Cycles -
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        _updateNavigationBarAlpha(1.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        _setupFavoriteButton()
        _setupTableView()
        _setupHeaderView()
        _updateNavigationBarAlpha(-_topInset)
        presenter.viewDidLoad()
    }
   
    private func _setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: _topInset, left: 0, bottom: 0, right: 0)
        if #available(iOS 15.0, *) {
            tableView.sectionHeaderTopPadding = 0.0
        }
    }
    
    private func _setupHeaderView() {
        let headerView = MovieHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 2))
        headerView.translatesAutoresizingMaskIntoConstraints = true
        if let model = presenter.movieHeaderModel {
            imageView.kf.setImage(with: URL(string: model.image ?? ""))
            headerView.setupData(model)
        }
        tableView.tableHeaderView = headerView
    }
    
    private func _setupFavoriteButton() {
        let image = IDNImage().getImage(.favorite)?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(_didFavoriteButtonTapped))
    }
    
    private func _updateNavigationBarAlpha(_ offsetY: CGFloat = -165.0) {
        let navBarHeight = navigationController?.navigationBar.frame.height ?? 0.0
        let threshold = 20.0
        let alpha = (offsetY + navBarHeight + threshold) / threshold
        let color = IDNColor().getColor(.basicLightGray).withAlphaComponent(alpha)
        navigationController?.navigationBar.backgroundColor = color
        statusBarView?.backgroundColor = color
    }
    
    private func _updateFooterConstraint() {
        if let bottomAnchor = tableView.tableHeaderView?.bottomAnchor {
            let anchor = footerView.topAnchor.constraint(equalTo: bottomAnchor)
            anchor.priority = .defaultLow
            anchor.isActive = true
        }
    }
    
    @objc private func _didFavoriteButtonTapped() {
        
    }
}

// MARK: - Extensions -

extension MovieDetailViewController: MovieDetailViewInterface {
    func reloadData() {
        Dispatch.main { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            self._setupHeaderView()
        }
    }
}

extension MovieDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension MovieDetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == tableView {
            _updateNavigationBarAlpha(scrollView.contentOffset.y)
            _updateFooterConstraint()
        }
    }
}
