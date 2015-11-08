//
//  Waypoint+CoreDataProperties.swift
//  Trip-Planner
//
//  Created by jdoge on 11/7/15.
//  Copyright © 2015 obliged. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Waypoint {

    @NSManaged var lon: NSNumber?
    @NSManaged var lat: NSNumber?
    @NSManaged var name: String?
    @NSManaged var tripOwner: Trip?

}
