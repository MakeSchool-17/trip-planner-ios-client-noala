//
//  CoreDataHelper.swift
//  Trip-Planner
//
//  Created by jdoge on 11/4/15.
//  Copyright © 2015 obliged. All rights reserved.
//

import Foundation
import CoreData


class CoreDataHelper {
    
    // single instance of coreData model
    static let singleInstance = CoreDataHelper()
    
    // reference instance from coreData model, one managed object context to rule them all
    static let managedObjectContext = CoreDataStack(stackType: .InMemory).managedObjectContext
    
    static func saveInitTrip(name: String, hasWaypoint: Bool) {
        let trip: Trip = NSEntityDescription.insertNewObjectForEntityForName("Trip", inManagedObjectContext: managedObjectContext) as! Trip
        trip.name = name
        trip.haswaypoint = false
        //4
        do {
            try managedObjectContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
            
    }
    
    static func getAllTrips() -> [Trip] {
        
        let fetchRequest = NSFetchRequest(entityName: "Trip")
        
        var results = [Trip]()

        do {
            results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Trip]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        return results
    }
    
}