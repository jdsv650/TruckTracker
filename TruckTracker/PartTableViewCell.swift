//
//  PartTableViewCell.swift
//  TruckTracker
//
//  Created by James on 3/27/16.
//  Copyright © 2016 James. All rights reserved.
//

import UIKit

class PartTableViewCell: UITableViewCell {

    
    @IBOutlet weak var vendorLabel: UILabel!
    @IBOutlet weak var partNumberLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var makeLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateRocrdedLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
