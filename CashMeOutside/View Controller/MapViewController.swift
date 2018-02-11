//
//  MapViewController.swift
//  CashMeOutside
//
//  Created by Anish Adhikari on 2/10/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit
import GoogleMaps
import MapKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    
        
        let camera = GMSCameraPosition.camera(withLatitude: 38.898305, longitude: -77.010611, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        
        
        
        
//        if let mylocation = mapView.myLocation {
//            print("User's location: \(mylocation)")
//        } else {
//            print("User's location is unknown")
//        }
        
        view = mapView
        
        
      
        

        // Do any additional setup after loading the view.
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations[0])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
