//
//  DispatchQueue+Extension.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 07/08/22.
//

import Foundation

typealias Dispatch = DispatchQueue

extension Dispatch {
    
    /// Enque on background thread
    /// - Parameter task: Task to be performed
    static func background(_ task: @escaping () -> Void) {
        if Thread.isMainThread {
            task()
        } else {
            Dispatch.global(qos: .background).async {
                task()
            }
        }
    }
    
    /// Enque on utility thread
    /// - Parameter task: Task to be performed
    static func utility(_ task: @escaping () -> Void) {
        if Thread.isMainThread {
            task()
        } else {
            Dispatch.global(qos: .utility).async {
                task()
            }
        }
    }
    
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
