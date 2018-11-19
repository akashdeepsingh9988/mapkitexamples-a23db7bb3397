//
//  LocationViewController.swift
//  MapKitExamples
//
//  Created by parrot on 2018-11-13.
//  Copyright © 2018 room1. All rights reserved.
//

import UIKit
import CoreLocation  //1. REQUIRED

// 2. add CLLocationManagerDelegate
class LocationViewController: UIViewController, CLLocationManagerDelegate {

    // 3. Make CoreLocation variable (locationManager)
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 4. Configure your corelocation variable
        manager = CLLocationManager()
        manager.delegate = self
        
        // how accurate do you want the lkocation to be?
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        // ask for permission to get the location
        manager.requestAlwaysAuthorization()
        
        // tell the manager to get the person's location
        manager.startUpdatingLocation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("got a new location")
        
        if (locations.count == 0) {
            print("Error getting your location!")
            return
        }
        else {
            print(locations[0])
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
