//
//  ContributeToGoalViewController.swift
//  FacebookAPI
//
//  Created by Sofia Knezevic on 2017-03-28.
//  Copyright © 2017 Scott Hetland. All rights reserved.
//

import UIKit
import Stripe

class ContributeToGoalViewController: UIViewController{
    
    @IBOutlet weak var contributionButton: UIButton!
    
    @IBOutlet weak var goalAmountLabel: UILabel!
    @IBOutlet weak var goalAmountMinusContributionLabel: UILabel!
    
    @IBOutlet weak var amountToContributeSlider: UISlider!
    
    @IBOutlet weak var amountToContributeLabel: UILabel!
    
    let backendBaseURL: String? = "http://localhost:4567/"
    
    //var paymentContext:STPPaymentContext?
   // let paymentCurrency = "cad"
    var jsonOfHost:[String:Any]?
    
    var stripePublishableKey:String?
    
    var partyItemToContributeTo:PartyItem?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUp()
    
        
    }
    
    func setUp() -> Void {
        
        //setup some safe unwrapping here
        
        let unwrappedGoalAmount = (partyItemToContributeTo?.itemGoal)! as Double
        goalAmountLabel.text = "\(unwrappedGoalAmount)"
        
        
    }
    

    @IBAction func contributionButtonPressed(_ sender: UIButton)
    {
        
        
        
        
        
    }
    
    @IBAction func amountToContributeSlider(_ sender: UISlider)
    {
        let itemContribution = Int(amountToContributeSlider.value)
        
        let partyItemGoal = Int((partyItemToContributeTo?.itemGoal)!)
        
        contributionButton.setTitle("Contribute $\(itemContribution)", for: UIControlState.normal)
        
        amountToContributeLabel.text = "$\(itemContribution)"

        goalAmountMinusContributionLabel.text = "$\(partyItemGoal - itemContribution) left until goal is reached!"
        
        
        
    }



}
