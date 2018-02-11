//
//  AmountCashViewController.swift
//  CashMeOutside
//
//  Created by Anish Adhikari on 2/10/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class AmountCashViewController: UIViewController, CLLocationManagerDelegate {
    
    let locationManager = CLLocationManager()
   
    var ref: DatabaseReference!
 
   

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        locationManager.delegate = self
        // Do any additional setup after loading the view.
        // Ask for Authorisation from the User.
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()

        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        
        let lat = locValue.latitude.magnitude
        let lng = locValue.longitude.magnitude
        
        ref = Database.database().reference()
        
 self.ref.child("receiver").child("anish").child("coords").setValue(["latitude":lat, "longitude": -1*lng])

        self.ref.child("receiver").child("anish").child("info").child("accepted").setValue("False")
        
        print("locations = \(locValue.latitude) \(locValue.longitude)")
        
        locationManager.stopUpdatingLocation()
    }
    
    @IBAction func onTapMainView(_ sender: Any) {
        view.endEditing(true)
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
