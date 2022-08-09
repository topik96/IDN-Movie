//
//  FavoriteViewController.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import UIKit

class FavoriteViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties -
    
    var presenter: FavoritePresenterInterface!
    
    // MARK: - Life Cycles -
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _setupEmptyStateView()
        presenter.viewWillAppear(animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupTableView()
    }
    
    private func _setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.contentInset = UIEdgeInsets(top: 24, left: 0, bottom: 0, right: 0)
        tableView.register(UINib(nibName: String(describing: MovieCell.self), bundle: nil), forCellReuseIdentifier: String(describing: MovieCell.self))
    }
    
    private func _setupEmptyStateView() {
        didEmptyStateButtonTapped = { [weak self] in
            guard let self = self else { return }
            self.presenter.viewWillAppear(animated: true)
        }
    }
    
    private func _getMovieItem(_ indexPath: IndexPath) -> Movie {
        guard let item = presenter.viewModel?.items[indexPath.section] as? FavoriteResultItem,
              let model = item.model?[indexPath.row] else { return Movie() }
        return model
    }
}

// MARK: - Extensions -

extension FavoriteViewController: FavoriteViewInterface {
    func reloadData() {
        Dispatch.main { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
    
    func setEmptyState(_ state: ViewEmptyState) {
        view.emptyState.show(state)
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.viewModel?.items[section].rowCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = _getMovieItem(indexPath)
        let cell = tableView.dequeueReusableCell(ofType: MovieCell.self, for: indexPath)
        cell.setupData(image: model.poster,
                       title: model.title,
                       subtitle: model.year,
                       suplementary: model.type?.rawValue.uppercased())
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.didMovieItemTapped(movie: _getMovieItem(indexPath))
    }
}
