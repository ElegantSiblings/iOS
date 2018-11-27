//
//  ViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 26/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class MainViewController: UIViewController {
  
  let myLoginButton = UIButton(type: .custom)
  let loginButton = LoginButton(readPermissions: [ .publicProfile ])
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loginButton.center = view.center
    
//
//    let loginButton = LoginButton(readPermissions: [ .publicProfile ])
//    loginButton.center = view.center
//
//    view.addSubview(loginButton)
    
    // Add a custom login button to your app
    myLoginButton.backgroundColor = UIColor.darkGray
    myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
    myLoginButton.center = view.center;
    myLoginButton.setTitle("My Login Button", for: .normal)
    
    // Handle clicks on the button
    myLoginButton.addTarget(
      self, action: #selector(loginButtonClicked), for: .touchUpInside
    )
    
    //view.addSubview(loginButton)
    
    // Add the button to the view
    view.addSubview(myLoginButton)
    
    if let accessToken = AccessToken.current {
      // User is logged in, use 'accessToken' here.
//      accessToken.appId
      print(accessToken.userId)
    }
    
  }
  
  // Once the button is clicked, show the login dialog
  @objc private func loginButtonClicked(_ sender: UIButton) {
    let loginManager = LoginManager()
    loginManager.logIn(readPermissions: [.publicProfile], viewController: self) { LoginResult in
      switch LoginResult {
      case .failed(let error):
        print(error)
      case .cancelled:
        print("User cancelled login.")
      case .success(let grantedPermissions, let declinedPermissions, let accessToken):
        print("Logged in!")
        print("-==============")
        print("-==============")
        if let accessToken = AccessToken.current {
          print(accessToken.userId)
          print(accessToken.authenticationToken)
          print(accessToken.appId)
        }
        print("-==============")
        print("-==============")
//        print("grant: ", grantedPermissions)
//        print("declined: ", declinedPermissions)
//        print("token: ", accessToken)
        
      }
      
    }
    
  }
}


/*
 override func viewDidLoad() {
 super.viewDidLoad()
 // Do any additional setup after loading the view, typically from a nib.
 
 
 // Add a custom login button to your app
 let myLoginButton = UIButton(type: .custom)
 myLoginButton.backgroundColor = UIColor.darkGray
 myLoginButton.frame = CGRect(x: 0, y: 0, width: 180, height: 40)
 myLoginButton.center = view.center
 myLoginButton.setTitle("My Login Button", for: .normal)
 
 // Handle clicks on the button
 myLoginButton.addTarget(self, action: Selector, action: @selector(self.loginButtonClicked) forControlEvents: .TouchUpInside)
 
 // Add the button to the view
 view.addSubview(myLoginButton)
 }
 
 // Once the button is clicked, show the login dialog
 @objc func loginButtonClicked() {
 let loginManager = LoginManager()
 loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
 switch loginResult {
 case .Failed(let error):
 print(error)
 case .Cancelled:
 print("User cancelled login.")
 case .Success(let grantedPermissions, let declinedPermissions, let accessToken):
 print("Logged in!")
 }
 
 
 }
 */
