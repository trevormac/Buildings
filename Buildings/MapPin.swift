//
//  MapPin.swift
//  Buildings
//
//  Created by Trevor MacGregor on 2017-05-29.
//  Copyright © 2017 TeevoCo. All rights reserved.
//

import MapKit

class MapPin: NSObject, MKAnnotation {
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle:String, coordinate:CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
