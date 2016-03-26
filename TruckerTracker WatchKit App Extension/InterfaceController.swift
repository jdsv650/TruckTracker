//
//  InterfaceController.swift
//  TruckerTracker WatchKit App Extension
//
//  Created by James on 3/24/16.
//  Copyright © 2016 James. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController {

    
    @IBOutlet var makeLabel: WKInterfaceLabel!
    @IBOutlet var modelLabel: WKInterfaceLabel!
    @IBOutlet var vinLabel: WKInterfaceLabel!
    @IBOutlet var yearLabel: WKInterfaceLabel!
    @IBOutlet var unitLabel: WKInterfaceLabel!
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let watchSession = WCSession.defaultSession()
        watchSession.delegate = self
        watchSession.activateSession()
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

}


extension InterfaceController: WCSessionDelegate {
    
    func session(session: WCSession, didReceiveApplicationContext applicationContext: [String : AnyObject]) {
        print("\(applicationContext)")
        dispatch_async(dispatch_get_main_queue(), {
        
            print("App Context count of key val pairs = \(applicationContext.count)")
            
            if let make = applicationContext["Make"] as? String
            {
                self.makeLabel.setText(make)
            }
            if let model = applicationContext["Model"] as? String
            {
                self.modelLabel.setText(model)
            }
            if let vin = applicationContext["VIN"] as? String
            {
                self.vinLabel.setText(vin)
            }
            if let unit = applicationContext["Unit#"] as? String
            {
                self.unitLabel.setText(unit)
            }
            if let year = applicationContext["Year"] as? String
            {
                self.yearLabel.setText(year)
            }
            
            
        })
    }
    
}
