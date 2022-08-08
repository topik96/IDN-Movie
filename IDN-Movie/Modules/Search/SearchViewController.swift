//
//  SearchViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit
import SkeletonView

class SearchViewController: BaseViewController {
    
    @IBOutlet weak var searchInputView: SearchInputView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties -
    
    var presenter: SearchPresenterInterface!
    
    // MARK: - Life Cycles -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupSearchInput()
        _setupTableView()
        presenter.viewDidLoad()
    }
    
    private func _setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 24, right: 0)
        tableView.register(UINib(nibName: String(describing: MovieCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieCell.self))
    }
    
    private func _setupSearchInput() {
        searchInputView.didSearchButtonTapped = { [weak self] data in
            guard let self = self, let title = data as? String else { return }
            self.presenter.didSearchButtonTapped(title: title)
        }
    }
}

// MARK: - Extensions -

extension SearchViewController: SearchViewInterface {
    func reloadData() {
        Dispatch.main { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.tableView.hideSkeleton()
        }
    }
}

extension SearchViewController: SkeletonTableViewDataSource, SkeletonTableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModel?.items[section].rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let item = presenter.viewModel?.items[indexPath.section] as? SearchViewModelResultItem,
              let model = item.model?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(ofType: MovieCell.self, for: indexPath)
        cell.setupData(image: model.poster,
                       title: model.title,
                       subtitle: model.year,
                       suplementary: model.type?.rawValue.uppercased())
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = presenter.viewModel?.items[indexPath.section] as? SearchViewModelResultItem,
              let model = item.model?[indexPath.row] else { return }
        presenter.didSelectItemTapped(movie: model)
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return "MovieCell"
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
}
