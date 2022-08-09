//
//  HomeLandingTests.swift
//  IDN-MovieTests
//
//  Created by Topik Mujianto on 08/08/22.
//

import XCTest

@testable import IDN_Movie

class HomeLandingTests: XCTestCase {

    var view: MockHomeLandingView!
    var interactor: MockHomeLandingInteractor!
    var wireframe: MockHomeLandingWireframe!
    
    var presenter: HomeLandingPresenter!
    
    override func setUp() {
        super.setUp()
        
        view = MockHomeLandingView()
        interactor = MockHomeLandingInteractor()
        wireframe = MockHomeLandingWireframe()
        
        presenter = HomeLandingPresenter(view: view,
                                       interactor: interactor,
                                       wireframe: wireframe)
        
    }
    
    func testRetrieveMovies() {
        let completion: IDNResponse<BaseSearch> = { (_,_) in }
        interactor.retrieveMovieSearch(paramRequest: MovieParamRequest(), completion: completion)
        XCTAssertTrue(interactor.isRetrieveMovieSearchCalled)
    }
    
    func testReloadData() {
        view.reloadData()
        XCTAssertTrue(view.isReloadDataCalled)
    }
    
    func testPosterImageTapped() {
        presenter.didPosterItemTapped(movie: Movie(title: nil))
        XCTAssertTrue(wireframe.isNavigateToMovieDetailCalled)
    }
}
