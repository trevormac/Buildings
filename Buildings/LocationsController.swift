//
//  LocationsController.swift
//  Buildings
//
//  Created by Trevor MacGregor on 2017-05-31.
//  Copyright © 2017 TeevoCo. All rights reserved.
//

import Foundation
import CoreLocation

class LocationsController:NSObject, CLLocationManagerDelegate {
    
    static var sharedLocationController:LocationsController = LocationsController()
    
    static var currentLocation:CLLocation? = nil
    static let locationManager:CLLocationManager = CLLocationManager()
    
    class func startGPS() {
        locationManager.delegate = LocationsController.sharedLocationController
        locationManager.desiredAccuracy  = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        locationManager.requestAlwaysAuthorization()
    }
    
    class func stopGPS() {
        locationManager.stopUpdatingLocation()
    }
    
    class func deviceLocation() -> CLLocationCoordinate2D {
        if ( currentLocation != nil) {
             return (currentLocation?.coordinate)!
        }else {
            return CLLocationCoordinate2DMake(0.0, 0.0)
        }
       
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        LocationsController.currentLocation = locations[0]
    }
}
