//
//  MenuTableViewCell.swift
//  KebukeMenu
//
//  Created by star on 2020/4/14.
//  Copyright © 2020 star. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var TeaImage: UIImageView!
    
    @IBOutlet weak var TeaNameLabel: UILabel!
    
    @IBOutlet weak var PriceLabrl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
