//
//  MockHomeLandingView.swift
//  IDN-MovieTests
//
//  Created by Topik Mujianto on 08/08/22.
//

import UIKit
@testable import IDN_Movie

final class MockHomeLandingView: HomeLandingViewInterface {
    
    private(set) var isReloadDataCalled = false
    
    func reloadData() {
        isReloadDataCalled = true
    }
}
