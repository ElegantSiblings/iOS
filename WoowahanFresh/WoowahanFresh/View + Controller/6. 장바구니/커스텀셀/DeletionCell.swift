//
//  deletionCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 12/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class DeletionCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      self.layer.borderWidth = 1.0
      self.layer.borderColor = UIColor.init(red: 213, green: 213, blue: 213, alpha: 0.4).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
