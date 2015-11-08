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
    
    var waypoints: [Waypoint] = []
    
    @IBOutlet weak var nowayView: UIView!
    
    @IBOutlet weak var wayView: UIView!
    
    
    @IBOutlet weak var wpTableView: UITableView!


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
        self.waypoints = CoreDataHelper.getAllWaypoints(specificTrip!)
        self.displayView()
        self.wpTableView.reloadData()
    }
    
    @IBAction func triggerAddNewWPView(sender: UIButton) {
        performSegueWithIdentifier("AddWaypoint", sender: sender)
    }
    
    
    @IBAction func addWpTo(sender: AnyObject) {
        performSegueWithIdentifier("AddWaypoint", sender: sender)
    }

    
    @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
        
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    var newTripViewController = NewTripViewController()
    
    
    func displayView() {
        
        //self.findTripInfo()
        
        
//        print(self.TripArray.dictionaryWithValuesForKeys(["haswaypoint"]))
//        print(self.TripArray.dictionaryWithValuesForKeys(["name"]))
        
        print(specificTrip)
        print(waypoints)
        
        if specificTrip?.haswaypoint == false {
        self.nowayView.frame = self.view.frame
        self.view.addSubview(self.nowayView)
        } else {
        self.wayView.frame = self.view.frame
        self.view.addSubview(self.wayView)
        }
        
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "AddWaypoint" {
            let destination = segue.destinationViewController as! NewWaypointNewTripViewController
                destination.loltrip = specificTrip
            
        }
    }
    
    

}


extension TripDisplayViewController: UITableViewDataSource {
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("wpCell", forIndexPath: indexPath)
        
        let waypoint = waypoints[indexPath.row]
        
        cell.textLabel!.text = waypoint.name

        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waypoints.count
    }
    
}


extension TripDisplayViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("AddWaypoint", sender: waypoints[indexPath.row])
        
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
}
