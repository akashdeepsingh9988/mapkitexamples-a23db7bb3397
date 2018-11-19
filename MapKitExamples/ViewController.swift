//
//  ViewController.swift
//  MapKitExamples
//
//  Created by MacStudent on 2018-11-12.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    // MARK: Outlets
    @IBOutlet weak var mapView: MKMapView!
    
    // MARK: Default functions
    override func viewDidLoad() {
        super.viewDidLoad()
        // EXAMPLE 1: Configuring what is displayed inside the map
        // ------------------------------------------------
        // set the center of the map
        let x = CLLocationCoordinate2DMake(43.6532, -79.3832)
        
        // pick a zoom level
        let y = MKCoordinateSpanMake(0.01, 0.01)
        
        // set the region property of the mapview
        let z = MKCoordinateRegionMake(x, y)
        self.mapView.setRegion(z, animated: true)
        
        
        // EXAMPLE 2:  Add a pin to the map
        // ------------------------------------------------
        
        // 1. Create a pin object
        let pin = MKPointAnnotation()
        
        // 2. Set the latitude / longitude of the pin
        pin.coordinate = x
        
        // 3. OPTIONAL: add a information popup (a "bubble")
        pin.title = "HERE IS SOME INFORMATION"
        
        // 4. Show the pin on the map
        self.mapView.addAnnotation(pin)
        
        // PRACTICE: Add another pin to the map
        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2DMake(43.6544, -79.3807)
        self.mapView.addAnnotation(pin2)
        
        // EXAMPLE 3:  Add a line to the map
        // ------------------------------------------------
        
        // 1. Create the coordinates for your line
        // 2. Put these coordinates in an array
        // 3. Create an MKPolyline object
        mapView.delegate = self
        
        // cn tower
        let pos1 = CLLocationCoordinate2DMake(43.6426, -79.3871)
        // lambton in toronto
        let pos2 = CLLocationCoordinate2DMake(43.773738, -79.335531)
        
        var locations = [pos1, pos2]

        let polyline = MKPolyline(coordinates: &locations, count: locations.count)
        
        mapView.add(polyline)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: FUNCTION FOR DRAWING POLYINES ON THE MAP
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if (overlay is MKPolyline) {
            let r = MKPolylineRenderer(overlay: overlay)
            r.strokeColor = UIColor.magenta     // set the color of the line
            r.lineWidth = 10                     // line thickness
            return r
        }
        return MKOverlayRenderer()
    }
    
    
    
    
    // MARK: Actions
    
    @IBAction func plusButtonPressed(_ sender: Any) {
        print("plus button pressed!")
        var r = mapView.region
        
        print("Current zoom: \(r.span.latitudeDelta)")
        
        r.span.latitudeDelta = r.span.latitudeDelta / 4
        r.span.longitudeDelta = r.span.longitudeDelta / 4
        print("New zoom: \(r.span.latitudeDelta)")
        print("-=------")
        self.mapView.setRegion(r, animated: true)
    }
    
    
    @IBAction func minusButtonPressed(_ sender: Any) {
        
        var r = mapView.region
        r.span.latitudeDelta = r.span.latitudeDelta * 2
        r.span.longitudeDelta = r.span.longitudeDelta * 2
        self.mapView.setRegion(r, animated: true)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}

