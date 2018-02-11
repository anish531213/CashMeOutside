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
    
        let camera = GMSCameraPosition.camera(withLatitude: 38.898305, longitude: -77.010611, zoom: 14.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        
        mapView.delegate = self
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 38.898305, longitude: -77.010611)
        marker.title = "My current"
        marker.snippet = "location"
        marker.map = mapView
        

        mapView.settings.myLocationButton = true
        
        ref = Database.database().reference()
        ref.child("receiver").observeSingleEvent(of: .value, with: {(snapshot) in
            // Get user value
            let userDictionary = snapshot.value as! NSDictionary
            
            let user1 = userDictionary["anish"] as? NSDictionary
            let coordinates = user1!["coords"] as? NSDictionary
            
            let userLat: Double = coordinates?["latitude"] as! Double
            let userLong: Double = coordinates?["longitude"] as! Double
            
            print(userLat)
            let position = CLLocationCoordinate2D(latitude: (userLat) , longitude: (userLong))
            let markerImage = UIImage(named: "dollar-green")!.withRenderingMode(.alwaysTemplate)
            let marker1 = GMSMarker(position: position)
            
            
        
            
            marker1.icon = self.image(markerImage, scaledToSize: CGSize(width: 25, height: 25))
            marker1.map = mapView
            
            
            
            //2nd user
            let user2 = userDictionary["devendra"] as? NSDictionary
            let coordinates2 = user2!["coords"] as? NSDictionary
            
            let userLat2: Double = coordinates2?["latitude"] as! Double
            let userLong2: Double = coordinates2?["longitude"] as! Double
            
            
            let position2 = CLLocationCoordinate2D(latitude: (userLat2) , longitude: (userLong2))
            let markerImage2 = UIImage(named: "dollar-green")!.withRenderingMode(.alwaysTemplate)
            let marker2 = GMSMarker(position: position2)
            
            
            
           
            marker2.icon = self.image(markerImage2, scaledToSize: CGSize(width: 25, height: 25))
            marker2.map = mapView
            
            
            
            //3nd user
            let user3 = userDictionary["mark"] as? NSDictionary
            let coordinates3 = user3!["coords"] as? NSDictionary
            
            let userLat3: Double = coordinates3?["latitude"] as! Double
            let userLong3: Double = coordinates3?["longitude"] as! Double
            
            let position3 = CLLocationCoordinate2D(latitude: (userLat3) , longitude: (userLong3))
            let markerImage3 = UIImage(named: "dollar-green")!.withRenderingMode(.alwaysTemplate)
            let marker3 = GMSMarker(position: position3)
            
            
        
            
            marker3.icon = self.image(markerImage3, scaledToSize: CGSize(width: 25, height: 25))
            marker3.map = mapView
            
            
            //let username = value?["username"] as? String ?? ""
            
            // ...
        }) {(error) in
            print(error.localizedDescription)
        }
        view = mapView

       
        // Do any additional setup after loading the view.
    }
    
    //Image function
    fileprivate func image(_ originalImage:UIImage, scaledToSize:CGSize) -> UIImage {
        if originalImage.size.equalTo(scaledToSize) {
            return originalImage
        }
        UIGraphicsBeginImageContextWithOptions(scaledToSize, false, 0.0)
        originalImage.draw(in: CGRect(x: 0, y: 0, width: scaledToSize.width, height: scaledToSize.height))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
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
