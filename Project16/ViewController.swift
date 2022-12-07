//
//  ViewController.swift
//  Project16
//
//  Created by Edwin Przeźwiecki Jr. on 19/09/2022.
//

import MapKit
import UIKit

class ViewController: UIViewController, MKMapViewDelegate {
    
    @IBOutlet var mapView: MKMapView!
    
    let mapTypes = ["Standard": MKMapType.standard, "Muted Standard": MKMapType.mutedStandard, "Hybrid": MKMapType.hybrid, "Satellite": MKMapType.satellite]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Challenge 2:
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Map type", style: .plain, target: self, action: #selector(selectMapType))
        
        /// Challenge 3:
        let london = Capital(title: "London", coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),/*info: "Home to the 2012 Summer Olympics."*/ url: "https://en.wikipedia.org/wiki/london")
        
        let oslo = Capital(title: "Oslo", coordinate: CLLocationCoordinate2D(latitude: 59.95, longitude: 10.75),/*info: "Founded over a thousand years ago."*/ url: "https://en.wikipedia.org/wiki/oslo")
        
        let paris = Capital(title: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8567, longitude: 2.3508),/*info: "Often called the City of Light."*/ url: "https://en.wikipedia.org/wiki/paris")
        
        let rome = Capital(title: "Rome", coordinate: CLLocationCoordinate2D(latitude: 41.9, longitude: 12.5),/*info: "Has a whole country inside it."*/ url: "https://en.wikipedia.org/wiki/rome")
        
        let washington = Capital(title: "Washington DC", coordinate: CLLocationCoordinate2D(latitude: 38.895111, longitude: -77.036667), /* info: "Named after George himself." */ url: "https://en.wikipedia.org/wiki/washington,_d.c.")
        
        mapView.addAnnotations([london, oslo, paris, rome, washington])
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard annotation is Capital else { return nil }
        
        let identifier = "Capital"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            
            let btn = UIButton(type: .detailDisclosure)
            
            annotationView?.rightCalloutAccessoryView = btn
        } else {
            annotationView?.annotation = annotation
            
            /// Challenge 1:
            if let dequeuedPin = annotation as? MKPinAnnotationView {
                dequeuedPin.pinTintColor = UIColor.black
            }
        }
        
        return annotationView as? MKPinAnnotationView
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        guard let capital = view.annotation as? Capital else { return }
        
        /* let placeName = capital.title
        let placeInfo = capital.info
        
        let ac = UIAlertController(title: placeName, message: placeInfo, preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "OK", style: .default))
        present(ac, animated: true) */
        
        loadWebsite(url: capital.url)
    }
    
    /// Challenge 3:
    func loadWebsite(url: String) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Web") as? WebViewController {
            
            vc.urlString = url
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    /// Challenge 2:
    @objc func selectMapType() {
        
        let ac = UIAlertController(title: "Map type", message: "Please choose the type of map you would like to use.", preferredStyle: .alert)
        
        for mapType in mapTypes {
            ac.addAction(UIAlertAction(title: "\(mapType.key)", style: .default, handler: mapTypeSelection))
        }
        
        present(ac, animated: true)
    }
    
    /// Challenge 2:
    func mapTypeSelection(action: UIAlertAction) {
        
        guard let title = action.title else { return }
        
        if let mapType = mapTypes[title] {
            mapView.mapType = mapType
        }
    }
}

