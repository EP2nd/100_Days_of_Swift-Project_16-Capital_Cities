//
//  Capital.swift
//  Project16
//
//  Created by Edwin Przeźwiecki Jr. on 20/09/2022.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var url: String
    //var info: String
    
    init(title: String, coordinate: CLLocationCoordinate2D,/*info: String*/ url: String) {
        self.title = title
        self.coordinate = coordinate
        self.url = url
        //self.info = info
    }
}
