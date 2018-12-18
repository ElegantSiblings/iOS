//
//  AddItemCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 12/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class AddItemCell: UITableViewCell {

  @IBOutlet weak var btnCheckbox: BtnCheckbox!
  @IBOutlet weak var imagethumbnail: UIImageView!
  
  @IBOutlet weak var labelCompany: UILabel!
  @IBOutlet weak var labelName: UILabel!
  
  @IBOutlet weak var textFieldCount: UITextField!
  @IBOutlet weak var btnChangeCount: UIButton!
  @IBOutlet weak var btnMiuns: UIButton!
  @IBOutlet weak var btnPlus: UIButton!
  
  @IBOutlet weak var textPrice: UILabel!
  @IBOutlet weak var textOrderPrice: UILabel!
  
  @IBOutlet weak var textDelivery: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    self.layer.borderWidth = 1.0
    self.layer.borderColor = UIColor.init(red: 213, green: 213, blue: 213, alpha: 0.4).cgColor
    btnChangeCount.layer.borderWidth = 1.0
    btnChangeCount.layer.borderColor = UIColor.black.cgColor
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
