//
//  ConnectToStripeViewController.swift
//  FacebookAPI
//
//  Created by Sofia Knezevic on 2017-03-27.
//  Copyright © 2017 Scott Hetland. All rights reserved.
//

import UIKit

class ConnectToStripeViewController: UIViewController, ServerInformationDelegate {

    var connectedAccountJSON:[String:Any]?
    
    var stripeEvent = Event()

    override func viewDidLoad() {
   
        super.viewDidLoad()
        
    }

    @IBAction func connectToStripePushed(_ sender: UIButton)
    {
        
        performSegue(withIdentifier: "authorizeStripe", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "authorizeStripe" {
            
            let newAuthorizationVC:StripeAuthorizationViewController = segue.destination as! StripeAuthorizationViewController
            newAuthorizationVC.delegate = self
            
            
        }
        
    }
    
    func retrieveJSON(newCustomerJSON: [String : Any]) {
        
        //send this JSON somewhere to store and also present if needed...
      
        
        self.connectedAccountJSON = newCustomerJSON
        
        print("\(self.connectedAccountJSON)")
        
        print("\(stripeEvent.eventID)")
        
        stripeEvent.stripeID = self.connectedAccountJSON?["stripe_user_id"] as! String
        
        print("\(stripeEvent.stripeID)")
        FirebaseManager.writeToFirebaseDBHostStripeUserID(eventID: stripeEvent.eventID!)
        self.dismiss(animated: true, completion: nil)
        
    }

}
