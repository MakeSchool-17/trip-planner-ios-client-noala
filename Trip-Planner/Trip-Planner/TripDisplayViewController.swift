//
//  TripDisplayViewController.swift
//  Trip-Planner
//
//  Created by jdoge on 11/1/15.
//  Copyright © 2015 obliged. All rights reserved.
//

import UIKit
import CoreData

class TripDisplayViewController: UIViewController {
    
    var specificTrip: Trip?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);

        self.displayView()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBOutlet weak var nowayView: UIView!

    @IBOutlet weak var wayView: UIView!
    
    var newTripViewController = NewTripViewController()
    
//    func findTripInfo() {
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
//            let results = try managedContext.executeFetchRequest(fetchRequest)
//            TripArray = results as! [NSManagedObject]
//            
//        } catch let error as NSError {
//            print("Could not fetch \(error), \(error.userInfo)")
//        }
//    }
    
    @IBAction func changeHasWaypoint(sender: UIButton) {
        specificTrip!.setValue(true, forKey: "haswaypoint")
    }
    
    
    func displayView() {
        
        //self.findTripInfo()
        
        
//        print(self.TripArray.dictionaryWithValuesForKeys(["haswaypoint"]))
//        print(self.TripArray.dictionaryWithValuesForKeys(["name"]))
        
        print(specificTrip)
        
        if specificTrip?.haswaypoint == false {
        self.view.addSubview(self.nowayView)
        } else {
        self.view.addSubview(self.wayView)
        }
        
        
        
    }
    
    

}
