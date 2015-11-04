//
//  NewTripViewController.swift
//  Trip-Planner
//
//  Created by jdoge on 11/1/15.
//  Copyright © 2015 obliged. All rights reserved.
//

import UIKit
import CoreData

class NewTripViewController: UIViewController {
    
    var trips : [Trip] = []
    

    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        
        
    }
    
    @IBAction func addName(sender: AnyObject) {
        
        //self.saveName(self.textField.text!, waypoint: true)
        
        let userInput = self.textField.text!
        
        CoreDataHelper.saveInitTrip(userInput, hasWaypoint: false)

    }
    
    
    
//    func saveName(name: String, waypoint: Bool) {
//        //1
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        //2
////        let entity =  NSEntityDescription.entityForName("Trip", inManagedObjectContext:managedContext)
////        
////        let trip = Trip(entity: entity!, insertIntoManagedObjectContext: managedContext)
////        
////        //3
////        trip.setValue(name, forKey: "name")
////        trip.setValue(waypoint, forKey: "haswaypoint")
//        
//        let trip: Trip = NSEntityDescription.insertNewObjectForEntityForName("Trip", inManagedObjectContext: managedContext) as! Trip
//        trip.name = name
//        trip.haswaypoint = false
//        
//        //4
//        do {
//            try managedContext.save()
//            //5
//            //trips.append(trip)
//        } catch let error as NSError  {
//            print("Could not save \(error), \(error.userInfo)")
//        }
//        
//        print(trips)
//        
//    }

}
