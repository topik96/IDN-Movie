//
//  MovieData+CoreDataProperties.swift
//  
//
//  Created by Topik Mujianto on 08/08/22.
//
//

import Foundation
import CoreData


extension MovieData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MovieData> {
        return NSFetchRequest<MovieData>(entityName: "MovieData")
    }

    @NSManaged public var id: String?
    @NSManaged public var title: String?
    @NSManaged public var year: String?
    @NSManaged public var type: String?
    @NSManaged public var savedDate: Date?

}
