//
//  HomeContentsView.swift
//  WoowahanFresh
//
//  Created by qbbang on 28/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class HomeContentsView: UIView {

  var tableView: UITableView!
  let screenSize = UIScreen.main.bounds
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    tableView = UITableView(frame: CGRect(
      x: screenSize.minX,
      y: screenSize.minY,
      width: screenSize.width,
      height: screenSize.height / 19
    ))
    
    print("HomeContentsView", screenSize)
    
    tableView.backgroundColor = .yellow
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}
