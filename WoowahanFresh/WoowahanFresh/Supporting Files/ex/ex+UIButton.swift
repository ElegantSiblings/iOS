//
//  ex+UIButton.swift
//  WoowahanFresh
//
//  Created by qbbang on 20/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

extension UIButton {
  // https://stackoverflow.com/questions/14523348/how-to-change-the-background-color-of-a-uibutton-while-its-highlighted
  private func image(withColor color: UIColor) -> UIImage? {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    
    context?.setFillColor(color.cgColor)
    context?.fill(rect)
    
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return image
  }
  
  func setBackgroundColor(_ color: UIColor, for state: UIControl.State) {
    self.setBackgroundImage(image(withColor: color), for: state)
  }
}
