//
//  VendorsTableViewController.swift
//  TruckTracker
//
//  Created by James on 3/27/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class VendorsTableViewController: UITableViewController {

    
    var vendors = [Vendor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let vendor1 = Vendor()
        vendor1.name = "Fleet Pride"
        vendor1.address = "Walden"
        vendor1.city = "Cheektowaga"
        vendor1.state = "NY"
        vendor1.zip = "ZIP Here"
        vendor1.phone = "Phone here"
        
        vendors.append(vendor1)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

   

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vendors.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("vendorCell", forIndexPath: indexPath) as! VendorTableViewCell

        // Configure the cell...
        cell.nameLabel.text = vendors[indexPath.row].name
        cell.addressLabel.text = vendors[indexPath.row].address
        cell.cityLabel.text = vendors[indexPath.row].city
        cell.stateLabel.text = vendors[indexPath.row].state
        cell.zipLabel.text = vendors[indexPath.row].zip
        cell.phoneLabel.text = vendors[indexPath.row].phone

        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
