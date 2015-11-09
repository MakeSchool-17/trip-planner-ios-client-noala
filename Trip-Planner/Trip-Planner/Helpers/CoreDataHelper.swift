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
    
//    static func deleteWaypoint(thisWaypoint: Waypoint){
//        managedObjectContext.deleteObject(thisWaypoint)
//        do {
//            try managedObjectContext.save()
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//    }
    
    static func deleteWaypoint(thisWaypoint: Waypoint){
        let predicate = NSPredicate(format: "objectID == %@", thisWaypoint)
        
        let fetchRequest = NSFetchRequest(entityName: "Waypoint")
        fetchRequest.predicate = predicate
        
        let fetchedEntities = self.managedObjectContext.objectWithID(thisWaypoint.objectID)
        
        self.managedObjectContext.deleteObject(fetchedEntities)
        
//        do {
//            let fetchedEntities = self.managedObjectContext.objectWithID(thisWaypoint.objectID)
//            //try self.managedObjectContext.executeFetchRequest(fetchRequest) as! [Waypoint]
////            if let entityToDelete = fetchedEntities.first {
////                self.managedObjectContext.deleteObject(entityToDelete)
////            }
////        } catch {
////            // Do something in response to error condition
////        }
//            self.managedObjectContext.deleteObject(fet
//        } catch {
//            // Do something in response to error condition
//        }

        
        do {
            try self.managedObjectContext.save()
        } catch {
            // Do something in response to error condition
        }
    }
    
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
    
//    func deleteIncidents() {
//        let appDel = UIApplication.sharedApplication().delegate as! AppDelegate
//        let context = appDel.managedObjectContext!
//        let coord = appDel.persistentStoreCoordinator
//        
//        let fetchRequest = NSFetchRequest(entityName: "Incidents")
//        let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
//        
//        do {
//            try coord.executeRequest(deleteRequest, withContext: context)
//        } catch let error as NSError {
//            debugPrint(error)
//        }
//    }
    
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