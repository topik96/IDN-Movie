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
    var endpoint: String { get set}
    var method: HTTPMethod { get set }
    var params: Parameters? { get set }
    var encoding: ParameterEncoding { get set }
    var headers: HTTPHeaders { get set }
}

extension APIConfig {
    var method: HTTPMethod {
        get { return .get }
        set { }
    }
    
    var headers: HTTPHeaders {
        get { return [:] }
        set { }
    }
    
    var encoding: ParameterEncoding {
        get { return URLEncoding.default }
        set { }
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
                case .success(let json):
                    print("SUCCES RESPONSE => \(json)")
                    do {
                        guard let data = response.data else { return }
                        let decoder = JSONDecoder()
                        let model = try decoder.decode(T.self, from: data)
                        completion(model, nil)
                    } catch let error as NSError {
                        completion(nil, error)
                    }
                case .failure(let error):
                    print("ERROR RESPONSE => \(error)")
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
