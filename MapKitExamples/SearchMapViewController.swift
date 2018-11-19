//
//  SearchMapViewController.swift
//  MapKitExamples
//
//  Created by parrot on 2018-11-14.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import MapKit

class SearchMapViewController: UIViewController {

    
    // MARK: Outlets
    @IBOutlet weak var searchBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Action
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        print("I pressed the search button!")
        
        
        // 1. Get the keyword from the user interface
        // 2. Send the keyword to Apple
        // 3. Wait for Apple the results
        // 4. Do something with the results
        let keyword = searchBox.text!
        
        let searchRequest = MKLocalSearchRequest()
        searchRequest.naturalLanguageQuery = keyword
        
        let coordinate = CLLocationCoordinate2DMake(43.6532, -79.3832)
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let r = MKCoordinateRegionMake(coordinate, span)
        
        searchRequest.region = r
        
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { (response, error) in
            // put code here
            // what do you want to do with the search results?
            // Examples - show it in the terminal! show it in the ui! your choice!
            //print(response?.mapItems)
            
            var places = response?.mapItems // [MKMapItems]
            // do something with the results
            for x in places! {
                print("Name: \(x.name)")
                print("Address: \(x.phoneNumber)")
                print("Lat:  \(x.placemark.coordinate.latitude)")
                print("Lng: \(x.placemark.coordinate.longitude)")
                print("=======")
            }
            
            
        }
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
