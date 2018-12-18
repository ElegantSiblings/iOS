//
//  ex+UILabel.swift
//  WoowahanFresh
//
//  Created by qbbang on 18/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{
  
  func makeOutLine(oulineColor: UIColor, foregroundColor: UIColor) {
    let strokeTextAttributes = [
      NSAttributedString.Key.strokeColor : oulineColor,
      NSAttributedString.Key.foregroundColor : foregroundColor,
      NSAttributedString.Key.strokeWidth : -4.0,
      NSAttributedString.Key.font : self.font
      ] as [NSAttributedString.Key : Any]
    self.attributedText = NSMutableAttributedString(string: self.text ?? "", attributes: strokeTextAttributes)
  }
  
  func underline() {
    if let textString = self.text {
      let attributedString = NSMutableAttributedString(string: textString)
      attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 5, length: attributedString.length))
      attributedText = attributedString
    }
  }
}
