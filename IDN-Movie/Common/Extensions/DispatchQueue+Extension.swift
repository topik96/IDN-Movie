//
//  DispatchQueue+Extension.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation

typealias Dispatch = DispatchQueue

extension Dispatch {
    /// Enque on main thread
    /// - Parameter task: Task to be performed
    static func main(_ task: @escaping () -> Void) {
        if Thread.isMainThread {
            task()
        } else {
            Dispatch.main.async {
                task()
            }
        }
    }
}
