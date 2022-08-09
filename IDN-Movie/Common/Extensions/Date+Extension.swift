//
//  Date+Extension.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 09/08/22.
//

import Foundation

extension Date {
    func getYears() -> [String] {
        var dates: [String] = []
        
        for i in 0...27 {
            if let date =  Calendar.current.date(byAdding: .year, value: -i, to: Date()) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy"
                dates.append(dateFormatter.string(from: date))
            }
        }
        return dates
    }
}
