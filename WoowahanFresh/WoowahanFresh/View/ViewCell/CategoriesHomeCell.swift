//
//  CategoriesHomeCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

protocol CategoriesHomeCellDelegate {
  
  func DidTabSubDish()
  func DidTabMainDish()
  func DidTabSoup()
  func DidTabKids()
  func DidTabRice()
}

class CategoriesHomeCell: UITableViewCell {

  @IBOutlet weak var scrollView: UIScrollView!
  var delegate: CategoriesHomeCellDelegate?
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    
    scrollView.frame = self.frame
    scrollView.contentSize.width += (self.frame.width + 50)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
  @IBAction func btnSubDish(_ sender: Any) {
    delegate?.DidTabSubDish()
  }
  
  @IBAction func btnMainDish(_ sender: Any) {
    delegate?.DidTabMainDish()
  }
  
  @IBAction func btnSoup(_ sender: Any) {
    delegate?.DidTabSoup()
  }
  
  @IBAction func btnKids(_ sender: Any) {
    delegate?.DidTabKids()
  }
  
  @IBAction func btnRice(_ sender: Any) {
    delegate?.DidTabRice()
  }
}
