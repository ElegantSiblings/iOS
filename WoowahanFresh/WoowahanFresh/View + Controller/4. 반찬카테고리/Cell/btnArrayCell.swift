//
//  btnArrayCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 18/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class btnArrayCell: UITableViewCell {
  
  @IBOutlet weak var btnAllList: UIButton!
  @IBOutlet weak var btnTwoList: UIButton!
  @IBOutlet weak var btnThreeList: UIButton!
  @IBOutlet weak var btnFourList: UIButton!
  @IBOutlet weak var btnFiveList: UIButton!
  @IBOutlet weak var btnSixList: UIButton!
  //MARK: 6아래 기본 투명도 0
  @IBOutlet weak var btnSevenList: UIButton!
  @IBOutlet weak var btnEightList: UIButton!
  @IBOutlet weak var btnNineList: UIButton!
  
  
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    btnAllList.titleLabel?.textColor = #colorLiteral(red: 0.1584468484, green: 0.7560812831, blue: 0.7372840047, alpha: 1)
    btnSevenList.alpha = 0
    btnEightList.alpha = 0
    btnNineList.alpha = 0
  }
  
  @IBAction func btnAllList(_ sender: Any) {
  }
  
  @IBAction func btnTwoList(_ sender: Any) {
  }
  
  @IBAction func btnThreeList(_ sender: Any) {
  }
  
  @IBAction func btnFourList(_ sender: Any) {
  }
  
  @IBAction func btnFiveList(_ sender: Any) {
  }
  
  @IBAction func btnSixList(_ sender: Any) {
  }
  
  @IBAction func btnSevenList(_ sender: Any) {
  }
  
  
  @IBAction func btnEightList(_ sender: Any) {
  }
  
  @IBAction func btnNineList(_ sender: Any) {
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
