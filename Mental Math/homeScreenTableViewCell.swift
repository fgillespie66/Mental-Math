//
//  homeScreenTableViewCell.swift
//  Mental Math
//
//  Created by Fiona Gillespie on 9/5/16.
//  Copyright © 2016 Fiona Gillespie. All rights reserved.
//

import UIKit

class homeScreenTableViewCell: UITableViewCell {

    @IBOutlet weak var arithmeticTableViewCell: UILabel!
    
    // MARK: Properties
    
    @IBOutlet weak var gameLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
