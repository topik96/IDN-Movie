//
//  MockHomeLandingInteractor.swift
//  IDN-MovieTests
//
//  Created by Topik Mujianto on 08/08/22.
//

import Foundation
import UIKit
import Alamofire

@testable import IDN_Movie

final class MockHomeLandingInteractor: HomeLandingInteractorInterface {
    
    private(set) var isRetrieveMovieSearchCalled = false
    
    private let _dataRequest: DataRequest = Alamofire.request("//")
    
    @discardableResult
    func retrieveMovieSearch(paramRequest: MovieParamRequest, completion: @escaping IDNResponse<BaseSearch>) -> DataRequest {
        isRetrieveMovieSearchCalled = true
        return _dataRequest
    }
}
