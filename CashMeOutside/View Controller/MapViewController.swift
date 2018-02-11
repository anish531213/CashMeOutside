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
import FirebaseDatabase

class MapViewController: UIViewController, GMSMapViewDelegate {
    
    var ref: DatabaseReference!

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
    
        
        let camera = GMSCameraPosition.camera(withLatitude: 38.898305, longitude: -77.010611, zoom: 13.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        
        mapView.delegate = self
        
        
//        if let mylocation = mapView.myLocation {
//            print("User's location: \(mylocation)")
//        } else {
//            print("User's location is unknown")
//        }
        

        mapView.settings.myLocationButton = true
        
        view = mapView
        // Do any additional setup after loading the view.
    }

    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        print("You tapped at \(coordinate.latitude), \(coordinate.longitude)")
        performViewSegue()
        writeFirebaseListener()
    }
   
    
    func writeFirebaseListener() {
        ref = Database.database().reference()
        
    self.ref.child("receiver").child("anish").child("info").child("accepted").setValue("True")
    }
    
    func performViewSegue() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let userVC = mainStoryboard.instantiateViewController(withIdentifier: "acceptedVC") as! AcceptedViewController
        present(userVC, animated: true, completion: nil)
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
