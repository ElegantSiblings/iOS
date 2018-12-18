//
//  ItemDelivery.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ItemDeliveryCell: UITableViewCell {

  @IBOutlet weak var deliveryType: UILabel!
  
  @IBOutlet weak var getItemDay: UILabel!
  
  @IBOutlet weak var deliveryRule: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
