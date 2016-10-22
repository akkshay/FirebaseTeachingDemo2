//
//  EventTableViewCell.swift
//  Events
//
//  Created by Akkshay Khoslaa on 10/22/16.
//  Copyright © 2016 Akkshay Khoslaa. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    var eventNameLabel: UILabel!
    var profPicImageView: UIImageView!
    var posterNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
