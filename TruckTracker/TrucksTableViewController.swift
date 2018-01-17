//
//  TrucksTableViewController.swift
//  TruckTracker
//
//  Created by James on 11/29/15.
//  Copyright © 2015 James. All rights reserved.
//

import UIKit
import WatchConnectivity

class TrucksTableViewController: UITableViewController, WCSessionDelegate {
    /** Called when all delegate callbacks for the previously selected watch has occurred. The session can be re-activated for the now selected watch using activateSession. */
    @available(iOS 9.3, *)
    func sessionDidDeactivate(_ session: WCSession) {
        print("")
    }

    /** Called when the session can no longer be used to modify or add any new transfers and, all interactive messages will be cancelled, but delegate callbacks for background transfers can still occur. This will happen when the selected watch is being changed. */
    @available(iOS 9.3, *)
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("")
    }

    /** Called when the session has completed activation. If session state is WCSessionActivationStateNotActivated there will be an error with more details. */
    @available(iOS 9.3, *)
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("")
    }


    var trucks = [Vehicle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let db3 = Vehicle()
        db3.make = "Mack"
        db3.model = "CV713"
        db3.serial = "014525"
        db3.unit = "DB3"
        db3.year = "2004"
        trucks.append(db3)
        
        let db4 = Vehicle()
        db4.make = "Kenworth"
        db4.model = "T800"
        db4.serial = "831943"
        db4.unit = "DB4"
        db4.year = "1999"
        trucks.append(db4)
        
        let tractor = Vehicle()
        tractor.make = "Kenworth"
        tractor.model = "T800"
        tractor.serial = "792214"
        tractor.unit = "Tractor"
        tractor.year = "1999"
        trucks.append(tractor)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trucks.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! VehicleTableViewCell

        // Configure the cell...
        cell.truckImageView.image = UIImage(named: "truck-256.png")
        cell.VINLabel.text = trucks[indexPath.row].serial
        cell.modelLabel.text = trucks[indexPath.row].model
        cell.makeLabel.text = trucks[indexPath.row].make
        cell.unitLabel.text = trucks[indexPath.row].unit
        cell.yearLabel.text = trucks[indexPath.row].year

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if WCSession.isSupported() {
            
            let watchSession = WCSession.default
            watchSession.delegate = self
            watchSession.activate()
            
            if watchSession.isPaired && watchSession.isWatchAppInstalled {
                do
                {
                    try watchSession.updateApplicationContext(
                        ["VIN": "\(trucks[indexPath.row].serial)",
                         "Model": "\(trucks[indexPath.row].model)",
                         "Unit#": "\(trucks[indexPath.row].unit)",
                         "Make": "\(trucks[indexPath.row].make)",
                         "Year": "\(trucks[indexPath.row].year)"])
                }
                catch let error as NSError
                {
                    print(error.description)
                }
            }
        }
    }





}
