//
//  APIService.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation
import Alamofire

typealias IDNResponse<T: Codable> = (T?, Error?) -> Void

protocol APIConfig {
    var endpoint: String { get set }
    var method: HTTPMethod { get set }
    var params: Parameters? { get set }
    var encoding: ParameterEncoding { get set }
    var headers: HTTPHeaders { get set }
}

extension APIConfig {
    var method: HTTPMethod {
        return .get
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
}

final class APIService<T: Codable> {
    static func getObject(setup: APIConfig, completion: @escaping IDNResponse<T>) -> DataRequest {
        if NetworkUtils.isConnectedToNetwork() {
            return Alamofire.request(setup.endpoint,
                                     method: setup.method,
                                     parameters: setup.params,
                                     encoding: setup.encoding,
                                     headers: setup.headers).responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    do {
                        guard let data = response.data else { return }
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(T.self, from: data)
                        completion(model, nil)
                    } catch let error as NSError {
                        completion(nil, error)
                    }
                case .failure(let error):
                    if let error = error as NSError? {
                        completion(nil, error)
                    }
                }
            })
        } else {
            let error = NSError(domain: "", code: IDNErrorCode.noConnection.rawValue, userInfo: [NSLocalizedDescriptionKey: "No Internet Connection"])
            completion(nil, error)
            return Alamofire.request("//")
        }
    }
}
