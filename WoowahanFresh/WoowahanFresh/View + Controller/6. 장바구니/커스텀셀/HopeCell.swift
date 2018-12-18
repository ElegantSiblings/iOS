//
//  HopeCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

protocol HopeCellDelegate  {
  
  func DidTabHopeDate()
  func DidTabContinue()
}


class HopeCell: UITableViewCell {

  @IBOutlet weak var orderPrice: UILabel!
  @IBOutlet weak var deliveryPrice: UILabel!
  @IBOutlet weak var totalPrice: UILabel!
  var delegate: HopeCellDelegate?
  
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    self.layer.borderWidth = 1.0
    self.layer.borderColor = UIColor.init(red: 213, green: 213, blue: 213, alpha: 0.4).cgColor
    }

  @IBAction func btnHopeDelivery(_ sender: Any) {
    delegate?.DidTabHopeDate()
  }
  
  @IBAction func btnContinue(_ sender: Any) {
    delegate?.DidTabContinue()
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
