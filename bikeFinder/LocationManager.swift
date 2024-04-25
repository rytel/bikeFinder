//
//  LocationManager.swift
//  bikeFinder
//
//  Created by Rafał Rytel on 26/04/2024.
//

import Foundation
import CoreLocation

class LocationManager: CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
    

    // For use in foreground
    self.locationManager.requestWhenInUseAuthorization()

    
}
