//
//  TripsViewController.swift
//  Trip-Planner
//
//  Created by jdoge on 11/1/15.
//  Copyright © 2015 obliged. All rights reserved.
//

import UIKit
import CoreData

class TripsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var parent = NewTripViewController()
    
    var trips: [Trip] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.trips = CoreDataHelper.getAllTrips()
        
//        //1
//        let appDelegate =
//        UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
//        let fetchRequest = NSFetchRequest(entityName: "Trip")
//        
//        //3
//        do {
//            let results =
//            try managedContext.executeFetchRequest(fetchRequest)
//            parent.trips = results as! [Trip]
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
        
        self.tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowExistingTrip" {
            let destination = segue.destinationViewController as! TripDisplayViewController
            // let selectedCell = tableView.cellForRowAtIndexPath(tableView.indexPathForSelectedRow!)!
            if let trippin = sender as! Trip?{
                destination.specificTrip = trippin
            }
            
        }
    }
    
    
    @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
        
    }
}

extension TripsViewController: UITableViewDataSource {
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TripCell", forIndexPath: indexPath) as! TripTableViewCell
        
        let trip = trips[indexPath.row]
        cell.textLabel!.text = trip.name
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trips.count
    }
    
}


extension TripsViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("ShowExistingTrip", sender: trips[indexPath.row])
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
}
