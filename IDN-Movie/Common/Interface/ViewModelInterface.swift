//
//  ViewModelInterface.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import Foundation

protocol ViewModelInterface {
    var rowCount: Int { get }
    var sectionTitle: String? { get }
}

extension ViewModelInterface {
    var rowCount: Int {
        return 0
    }
    var sectionTitle: String? {
        return nil
    }
}
