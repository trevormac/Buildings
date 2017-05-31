//
//  ViewController.swift
//  Buildings
//
//  Created by Trevor MacGregor on 2017-05-29.
//  Copyright © 2017 TeevoCo. All rights reserved.
//

import UIKit
import MapKit


class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //let our view know that the pins are coming in from the background thread
        NotificationCenter.default.addObserver(forName: BuildingsController.BUILDING_ADDED_NOTIFICATION, object: nil, queue: nil) { notification in
            let newBuildingPin:MapPin =  notification.object as! MapPin
            
            self.mapView.addAnnotation(newBuildingPin)
        }
       
        let buildingsArray:Array = BuildingsController.sharedBuildings()
        for (_, currentObject) in buildingsArray.enumerated() {
            let buildingPin:MapPin = currentObject as! MapPin
            mapView.addAnnotation(buildingPin)
            
        }
        //Map Zoom:
        //will define how much our map will show
        let distanceSpan:CLLocationDegrees = 2000
        //sets our campus location with gps coordinates
        let bsuCSCampusLocation:CLLocationCoordinate2D = LocationsController.deviceLocation()
        if bsuCSCampusLocation.latitude != 0.0 {
            
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(bsuCSCampusLocation, distanceSpan, distanceSpan), animated: true)
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

