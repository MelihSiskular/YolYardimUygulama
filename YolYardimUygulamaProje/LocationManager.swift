//
//  LocationManager.swift
//  YolYardimUygulamaProje
//
//  Created by Melih Şişkular on 19.04.2025.
//

import Foundation
import CoreLocation
import SwiftUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var currentLocation: CLLocationCoordinate2D? = nil
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation() 
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else { return }
        DispatchQueue.main.async {
            self.currentLocation = loc.coordinate
        }
    }
}
func sehirBul(latitude: Double, longitude: Double, completion: @escaping (String?) -> Void) {
    let location = CLLocation(latitude: latitude, longitude: longitude)
    let geocoder = CLGeocoder()
    
    geocoder.reverseGeocodeLocation(location) { placemarks, error in
        if let error = error {
            print("Geocode hatası: \(error.localizedDescription)")
            completion(nil)
            return
        }
        
        if let placemark = placemarks?.first {
            let sehir = placemark.locality ?? placemark.administrativeArea ?? placemark.country
            completion(sehir)
        } else {
            completion(nil)
        }
    }
}
