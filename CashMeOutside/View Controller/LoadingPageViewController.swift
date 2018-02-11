//
//  LoadingPageViewController.swift
//  CashMeOutside
//
//  Created by Anish Adhikari on 2/10/18.
//  Copyright © 2018 Anish Adhikari. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LoadingPageViewController: UIViewController {

    @IBOutlet weak var searchBar: UIProgressView!
    
    var ref: DatabaseReference!
    
    override func viewDidLoad() {

        super.viewDidLoad()
        
        

        searchBar.setProgress(10, animated: true)
        readFirebaseData()
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func readFirebaseData() {
        
        ref = Database.database().reference()
        ref.child("receiver").child("anish").observe(.value, with: { (snapshot) in
            // Get user value
            let value = snapshot.value as? NSDictionary
            let info_val = value?["info"] as? NSDictionary
            
            let status = info_val?["accepted"] as? String!
            
            if status! == "True" {
                print("conduct Segue")
                self.performViewSegue()
            } else {
                print("Wait")
            }
            
            
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
    }
    
    
    
    func performViewSegue() {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let userVC = mainStoryboard.instantiateViewController(withIdentifier: "cashRequestView") as! RequestAViewController
        present(userVC, animated: true, completion: nil)
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
