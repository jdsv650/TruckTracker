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
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        let watchSession = WCSession.default
        watchSession.delegate = self
        watchSession.activate()
        
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
    /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    @available(watchOS 2.2, *)
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("not implemented")
    }

    
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        print("\(applicationContext)")
        DispatchQueue.main.async(execute: {
        
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
