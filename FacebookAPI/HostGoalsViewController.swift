//
//  HostGoalsViewController.swift
//  FacebookAPI
//
//  Created by Sofia Knezevic on 2017-03-27.
//  Copyright © 2017 Scott Hetland. All rights reserved.
//

import UIKit

class HostGoalsViewController: UIViewController {
    
    //pass forward the information from the selected event. Will use some info and pass forward to detail view controller
    var hostEvent:Event?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func eventDetailsPushed(_ sender: UIButton) {

        performSegue(withIdentifier: "showEventDetail", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showEventDetail") {
            let detailVC:DetailViewController = segue.destination as! DetailViewController
            detailVC.detailEvent = hostEvent
            
        }
    }
}
