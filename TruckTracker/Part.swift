//
//  Part.swift
//  TruckTracker
//
//  Created by James on 3/27/16.
//  Copyright © 2016 James. All rights reserved.
//

import Foundation

open class Part
{
    var partNumber = ""
    var partDescription = ""
    var make = ""
    var vendor = Vendor()
    var priceRecorded: Double?
    var dateRecorded: Date?
}
