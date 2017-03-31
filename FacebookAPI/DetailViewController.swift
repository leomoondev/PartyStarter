//
//  DetailViewController.swift
//  FacebookAPI
//
//  Created by Scott Hetland on 2017-03-22.
//  Copyright © 2017 Scott Hetland. All rights reserved.
//

import UIKit
import FacebookCore
import MapKit

class DetailViewController: UIViewController {
    
    var detailEvent:Event?
    
    @IBOutlet weak var eventDescriptionLabel: UILabel!
    @IBOutlet weak var endTimeLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var eventIDLabel: UILabel!
    @IBOutlet weak var addresslabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var rsvpStatusLabel: UILabel!
    @IBOutlet weak var eventImageView: UIImageView!
    @IBOutlet weak var attendeesLabel: UILabel!
    @IBOutlet weak var adminsLabel: UILabel!
    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailEventNameLabel: UILabel!
    @IBOutlet weak var detailLocationLabel: UILabel!
    @IBOutlet weak var detailTextField: UITextView!
    @IBOutlet weak var detailrsvpLabel: UILabel!
    @IBOutlet weak var navigationButtonOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //download image and set it to the imageview
        DataManager.getEventImage(eventID: (detailEvent?.eventID)!) { image in
            
            DispatchQueue.main.async {
                self.detailEvent?.coverPhoto = image.photo
                
                self.detailImageView.image = self.detailEvent?.coverPhoto
            }

        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setup()

    }
    
    
    func setup() -> Void {
        
        //will need to make sure that if one of these are nil, program does not crash.
        
        let unwrappedRSVP = (detailEvent?.rsvpStatus)! as String
        
        
        
        
        detailEventNameLabel.text = detailEvent?.eventName
        detailLocationLabel.text = detailEvent?.placeName
        detailTextField.text = detailEvent?.eventDescription
        detailrsvpLabel.text = "RSVP Status: \(unwrappedRSVP)"

    }
    
    @IBAction func mapToEvent(_ sender: UIButton) {
        //when this button is pressed you need to check whether or not the event has valid coordinates. If so then map them
        if (detailEvent?.latitute != nil) {
            //do the stuff
            print("has coordinates")
            
            
            let pinCoordinates = CLLocationCoordinate2D.init(latitude: (detailEvent?.latitute)!, longitude: (detailEvent?.longitude)!)
            let placeMark = MKPlacemark.init(coordinate: pinCoordinates)
            let mapItem = MKMapItem.init(placemark: placeMark)
            
            mapItem.name = detailEvent?.eventName
            mapItem.openInMaps(launchOptions: nil)
    
        } else {
            
            self.navigationButtonOutlet.setTitle("Not Available", for: .normal)
            print("no coordinates")
        }
    }
    
}
