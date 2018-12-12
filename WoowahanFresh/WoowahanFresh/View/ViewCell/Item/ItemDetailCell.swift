//
//  ItemDetailCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 10/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ItemDetailCell: UITableViewCell {

  @IBOutlet weak var detailImage: UIImageView!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    // 이미지 프레임 벗어나는거 방지
    detailImage.clipsToBounds = true
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }
    
}
