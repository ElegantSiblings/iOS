//
//  ItemTitleCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ItemTitleCell: UITableViewCell {

  @IBOutlet weak var title: UILabel!
  
  @IBOutlet weak var subTitle: UILabel!
  
  @IBOutlet weak var disCount: UILabel!
  
  @IBOutlet weak var salePrice: UILabel!
  
  @IBOutlet weak var originPrice: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    title.translatesAutoresizingMaskIntoConstraints = false
    
    subTitle.translatesAutoresizingMaskIntoConstraints = false
    
    disCount.translatesAutoresizingMaskIntoConstraints = false
    
    salePrice.translatesAutoresizingMaskIntoConstraints = false
    
    originPrice.translatesAutoresizingMaskIntoConstraints = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
