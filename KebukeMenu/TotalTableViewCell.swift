//
//  TotalTableViewCell.swift
//  KebukeMenu
//
//  Created by star on 2020/4/16.
//  Copyright © 2020 star. All rights reserved.
//

import UIKit

class TotalTableViewCell: UITableViewCell {

    @IBOutlet weak var Nmae: UILabel!
    
    @IBOutlet weak var TeaName: UILabel!
    
    @IBOutlet weak var Size: UILabel!
    
    @IBOutlet weak var Suger: UILabel!
    
    @IBOutlet weak var Ice: UILabel!
    
    @IBOutlet weak var Addition: UILabel!
    
    @IBOutlet weak var price: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
