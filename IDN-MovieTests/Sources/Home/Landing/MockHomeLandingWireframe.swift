//
//  MockHomeLandingWireframe.swift
//  IDN-MovieTests
//
//  Created by Topik Mujianto on 08/08/22.
//

import Foundation
import UIKit
@testable import IDN_Movie

final class MockHomeLandingWireframe: HomeLandingWireframeInterface {
    
    private(set) var isNavigateToMovieDetailCalled = false
    
    func navigate(to option: HomeLandingNavigationOption) {
        switch option {
        case .movieDetail(_):
            isNavigateToMovieDetailCalled = true
        }
    }
}
