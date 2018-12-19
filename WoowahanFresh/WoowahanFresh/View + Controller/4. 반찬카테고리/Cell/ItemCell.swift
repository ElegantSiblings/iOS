//
//  ItemCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 07/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//



import UIKit

protocol ItemCellDelegate  {
  
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
  var itemPkNumber = 0
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//    self.focusStyle = .custom
    
    self.layer.borderWidth = 1.0
    self.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
//    btnheart.setImage(UIImage(named: "HeartRed"), for: .selected)
//    btnheart.setImage(UIImage(named: "HeartNil"), for: .normal)
//    
//    btnheart.addTarget(self, action: #selector(BtnCheckbox.buttonClicked(_:)), for: .touchUpInside)
    
    }
  
//  @objc func buttonClicked(_ sender: UIButton) {
//    self.isSelected.toggle()
//
//    if btnheart.isSelected {
//      //MARK: Alamofire - 활성화 요청
//      print("isSelected On")
//    } else {
//      //MARK: Alamofire - 비활성화 요청
//      print("isSelected OFF")
//    }
//  }

  override func layoutSubviews() {
    super.layoutSubviews()
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
