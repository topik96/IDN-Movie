//
//  CoreDataUtils.swift
//  IDN-Movie
//
//  Created by Topik Mujianto on 08/08/22.
//

import Foundation
import CoreData

struct CoreDataUtils {
    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "IDN-Movie")
        container.loadPersistentStores(completionHandler: { (_, error) in
            container.viewContext.mergePolicy = NSMergePolicy(merge: .mergeByPropertyObjectTrumpMergePolicyType)
            if let error = error as NSError? {
                print("CoreDataUtils error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func saveContext(forContext context: NSManagedObjectContext = CoreDataUtils.persistentContainer.viewContext) {
        if context.hasChanges {
            context.performAndWait {
                do {
                    try context.save()
                } catch {
                    print("Save context error \(error.localizedDescription)")
                }
            }
        }
    }
    
    // MARK: - Movies -
    
    static func retrieveMovies() -> [MovieData] {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<MovieData>(entityName: "MovieData")
        request.returnsDistinctResults = false
        do {
            let result = try context.fetch(request)
            return result
        } catch {
            return []
        }
    }
    
    static func retrieveMovie(parameter: String) -> MovieData? {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<MovieData>(entityName: "MovieData")
        request.predicate = NSPredicate(format: "id == %@", parameter)
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            return result.first
        } catch {
            return nil
        }
    }
    
    static func insertMovie(_ movie: Movie) {
        let context = persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "MovieData", in: context) {
            let insert = NSManagedObject(entity: entity, insertInto: context)
            insert.setValue(movie.id, forKey: "id")
            insert.setValue(movie.title, forKey: "title")
            insert.setValue(movie.year, forKey: "year")
            insert.setValue(movie.type?.rawValue, forKey: "type")
            insert.setValue(movie.poster, forKey: "poster")
            insert.setValue(Date(), forKey: "savedDate")
            do {
                try context.save()
            } catch let error {
                print("Error insert movie: \(error.localizedDescription)")
            }
        }
    }
    
    static func deleteMovie(parameter: String) {
        let context = persistentContainer.viewContext
        let request = NSFetchRequest<MovieData>(entityName: "MovieData")
        request.predicate = NSPredicate(format: "id == %@", parameter)
        do {
            let result = try context.fetch(request)
            for object in result {
                context.delete(object)
            }
            try context.save()
        } catch {
            print("Error delete movie")
        }
    }
}
