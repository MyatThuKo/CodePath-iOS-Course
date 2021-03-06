//
//  RestaurantCell.swift
//  Yelpy
//
//  Created by Myat Thu Ko on 2/5/21.
//  Copyright © 2021 memo. All rights reserved.
//

import UIKit

class RestaurantCell: UITableViewCell {

    @IBOutlet var label: UILabel!
    @IBOutlet var phoneNumberLabel: UILabel!
    @IBOutlet var restaurantImage: UIImageView!
    @IBOutlet var starRatingImage: UIImageView!
    @IBOutlet var reviewCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
