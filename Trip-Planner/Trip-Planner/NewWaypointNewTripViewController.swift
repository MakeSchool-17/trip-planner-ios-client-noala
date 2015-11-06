//
//  NewWaypointNewTripViewController.swift
//  Trip-Planner
//
//  Created by jdoge on 11/4/15.
//  Copyright © 2015 obliged. All rights reserved.
//

import UIKit
import GoogleMaps

class NewWaypointNewTripViewController: UIViewController,UISearchBarDelegate, LocateOnTheMap {
    
    var searchResultController:SearchResultsController!
    var resultsArray = [String]()
    var googleMapsView:GMSMapView!
    
    
    @IBOutlet weak var mapView: UIView!

    @IBAction func searchPlacesBtn(sender: AnyObject) {
        
        let searchController = UISearchController(searchResultsController: searchResultController)
        searchController.searchBar.delegate = self
        self.presentViewController(searchController, animated: true, completion: nil)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.googleMapsView =  GMSMapView(frame: self.mapView.frame)
        self.view.addSubview(self.googleMapsView)
        searchResultController = SearchResultsController()
        searchResultController.delegate = self
        
    }

    let parent = TripDisplayViewController()
    
    var loltrip: Trip?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func locateWithLongitude(lon: Double, andLatitude lat: Double, andTitle title: String) {
        
        dispatch_async(dispatch_get_main_queue()) { () -> Void in
            let position = CLLocationCoordinate2DMake(lat, lon)
            let marker = GMSMarker(position: position)
            
            let camera  = GMSCameraPosition.cameraWithLatitude(lat, longitude: lon, zoom: 11)
            self.googleMapsView.camera = camera
            
            marker.title = title
            marker.map = self.googleMapsView
        }
    }
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String){
        
        let placesClient = GMSPlacesClient()
        placesClient.autocompleteQuery(searchText, bounds: nil, filter: nil) { (results, error:NSError?) -> Void in
            self.resultsArray.removeAll()
            if results == nil {
                return
            }
            for result in results!{
                if let result = result as? GMSAutocompletePrediction{
                    self.resultsArray.append(result.attributedFullText.string)
                }
            }
            self.searchResultController.reloadDataWithArray(self.resultsArray)
        }
    }
    
    
    
//    @IBAction func changeHasWaypoint(sender: UIButton) {
//        loltrip!.setValue(true, forKey: "haswaypoint")
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//        
//        
//        
//    }
    
    
//    @IBAction func unwindToSegue(segue: UIStoryboardSegue) {
//        
//    }
}
