//
//  LoginViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

import FBSDKLoginKit

//import FBSDKLoginKit

class LoginViewController: UIViewController {
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
  }
  
  @IBAction func btnLoginFacebook(_ sender: Any) {
    
    let loginManager = FBSDKLoginManager()
    loginManager.logIn(withReadPermissions: ["public_profile","email"], from: self, handler: { (result, error) in
      if (error == nil) {
        let fblofinresult: FBSDKLoginManagerLoginResult = result!
         print((fblofinresult.grantedPermissions.contains("emil")))
       
      }
    })
  }
  
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("close")
    }
  }
  

}
