//
//  Trip+CoreDataProperties.swift
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

extension Trip {

    @NSManaged var haswaypoint: NSNumber?
    @NSManaged var name: String?
    @NSManaged var groupedWP: NSSet?

}
