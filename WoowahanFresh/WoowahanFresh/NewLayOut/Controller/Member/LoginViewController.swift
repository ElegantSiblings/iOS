//
//  LoginViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

  }
  
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("close")
    }
  }
  

}
