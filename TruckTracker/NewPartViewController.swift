//
//  NewPartViewController.swift
//  TruckTracker
//
//  Created by James on 3/27/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class NewPartViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var vendorTF: UITextField!
    
    
    @IBOutlet weak var theDescriptionTV: UITextView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        vendorTF.delegate = self
    }
    
    override func viewWillAppear(animated: Bool) {
        theDescriptionTV.becomeFirstResponder()
    }
    
    
    func textFieldDidBeginEditing(textField: UITextField) {
        print("didbeginediting")
        
        if textField == vendorTF
        {
            self.performSegueWithIdentifier("vendorSegue", sender: self)
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "vendorSegue"
        {
            
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
