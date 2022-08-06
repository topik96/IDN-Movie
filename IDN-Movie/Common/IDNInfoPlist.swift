//
//  IDNInfoPlist.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 06/08/22.
//

import Foundation

struct IDNInfoPlist {
    static var baseURL: String {
        guard let baseURL = Bundle.main.infoDictionary?[IdentifierConstant.InfoPlist.baseURL] as? String else { fatalError("BASE URL NOT FOUND") }
        return baseURL
    }
    
    static var apiKey: String {
        guard let baseURL = Bundle.main.infoDictionary?[IdentifierConstant.InfoPlist.apiKey] as? String else { fatalError("API KEY NOT FOUND") }
        return baseURL
    }
}

struct IdentifierConstant {
    struct InfoPlist {
        static let baseURL = "BaseURL"
        static let apiKey = "APIKey"
    }
}
