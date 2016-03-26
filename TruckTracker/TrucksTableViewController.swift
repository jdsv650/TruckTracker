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

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trucks.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! VehicleTableViewCell

        // Configure the cell...
        cell.truckImageView.image = UIImage(named: "truck-256.png")
        cell.VINLabel.text = trucks[indexPath.row].serial
        cell.modelLabel.text = trucks[indexPath.row].model
        cell.makeLabel.text = trucks[indexPath.row].make
        cell.unitLabel.text = trucks[indexPath.row].unit
        cell.yearLabel.text = trucks[indexPath.row].year

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        
        if WCSession.isSupported() {
            
            let watchSession = WCSession.defaultSession()
            watchSession.delegate = self
            watchSession.activateSession()
            
            if watchSession.paired && watchSession.watchAppInstalled {
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
