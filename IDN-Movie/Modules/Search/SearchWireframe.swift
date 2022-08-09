//
//  SearchWireframe.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

final class SearchWireframe: BaseWireframe {
    
    // MARK: - Life Cycle -
    
    init() {
        let moduleViewController = SearchViewController()
        super.init(viewController: moduleViewController)
        let interactor = SearchInteractor()
        let presenter = SearchPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }
    
    private func _openFilterMovie(handler: ButtonEventWithParameterHandler?) {
        let contentView = FilterView()
        let bottomSheet = BottomsheetController(contentView: contentView)
        var param = MovieParamRequest(year: "2022", type: .movie)
        contentView.didSelectType = { data in
            param.type = data as? MovieType
        }
        contentView.didSelectYear = { data in
            param.year = data as? String
        }
        contentView.didFilterButtonTapped = {
            bottomSheet.dismiss()
            Dispatch.main.asyncAfter(deadline: .now() + 0.5) {
                handler?(param)
            }
        }
        bottomSheet.present(viewController)
    }
}

// MARK: - Extensions -

extension SearchWireframe: SearchWireframeInterface {
    func navigate(to option: SearchNavigationOption) {
        switch option {
        case .movieDetail(let movie):
            navigationController?.pushWireframe(MovieDetailWireframe(movie: movie))
        case .filterMovie(let handler):
            _openFilterMovie(handler: handler)
        case .emptyTitle:
            showGeneralErrorAlert("You have to fill in the title first to find movies")
        }
    }
}
