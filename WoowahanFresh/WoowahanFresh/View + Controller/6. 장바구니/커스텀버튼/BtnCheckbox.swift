//
//  btnCheckbox.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class BtnCheckbox: UIButton {
  
  override func awakeFromNib() {
    
    self.setImage(UIImage(named:"selected"), for: .selected)
    self.setImage(UIImage(named:"rectangle"), for: .normal)
    
    self.addTarget(self, action: #selector(BtnCheckbox.buttonClicked(_:)), for: .touchUpInside)
  }
  
  @objc func buttonClicked(_ sender: UIButton) {
    self.isSelected.toggle()
    
    if self.isSelected {
      //MARK: Alamofire - 활성화 요청
      print("isSelected On")
    } else {
      //MARK: Alamofire - 비활성화 요청
      print("isSelected OFF")
    }
    
  }
  
}
