//
//  ContentViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 29/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
  
  @IBOutlet weak var scrollView: UIScrollView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    scrollView.isPagingEnabled = true
    
  }
  
  
}
