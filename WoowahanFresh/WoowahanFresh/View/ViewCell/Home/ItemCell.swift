//
//  ItemCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 07/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//



import UIKit

protocol ItemCellDelegate  {
  
  func DidTabCell()
  func DidTabHeart()
  func DidTabShopping()
}

class ItemCell: UITableViewCell {
  
  @IBOutlet weak var listThumbnail: UIImageView!
  @IBOutlet weak var discountRate: UILabel!
  @IBOutlet weak var titel: UILabel!
  @IBOutlet weak var salePrice: UILabel!
  @IBOutlet weak var originPrice: UILabel!
  @IBOutlet weak var btnheart: UIButton!
  var delegate: ItemCellDelegate?
  var itemPkNumber = "String"
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
  
  @IBAction func btnCell(_ sender: Any) {
    delegate?.DidTabCell()
  }
  
  @IBAction func btnHeart(_ sender: Any) {
    
    delegate?.DidTabHeart()
  }
  
  @IBAction func btnShopping(_ sender: Any) {
    delegate?.DidTabShopping()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
