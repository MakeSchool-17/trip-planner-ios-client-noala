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
    
    static func addWaypoint(lon: Double, andLatitude lat: Double, andName name: String, andTripOwner tripOwner: Trip) {
        let waypoint: Waypoint = NSEntityDescription.insertNewObjectForEntityForName("Waypoint", inManagedObjectContext: managedObjectContext) as! Waypoint
        waypoint.lon = lon
        waypoint.lat = lat
        waypoint.name = name
        waypoint.tripOwner = tripOwner
        
        do {
            try managedObjectContext.save()
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
    }
    
    static func getAllWaypoints(nameTrip: Trip) -> [Waypoint] {
        let predicate = NSPredicate(format: "%K== %@", "tripOwner", nameTrip)
        let fetchRequest = NSFetchRequest(entityName: "Waypoint")
        fetchRequest.predicate = predicate
        var results = [Waypoint]()

        do {
            results = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Waypoint]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        return results
    }
    
}