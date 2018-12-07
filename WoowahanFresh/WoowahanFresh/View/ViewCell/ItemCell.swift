//
//  ItemCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 07/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

  @IBOutlet weak var listThumbnail: UIImageView!
  
  @IBOutlet weak var discountRate: UILabel!
  
  @IBOutlet weak var titel: UILabel!
  
  @IBOutlet weak var salePrice: UILabel!
  
  @IBOutlet weak var originPrice: UILabel!
  
  var itemPkNumber = "String"
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

  @IBAction func btnHeart(_ sender: Any) {
  }
  
  @IBAction func btnShopping(_ sender: Any) {
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
