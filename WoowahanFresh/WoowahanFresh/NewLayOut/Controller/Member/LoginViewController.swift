//
//  LoginViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

import FacebookLogin
import FacebookCore
//import FBSDKLoginKit

class LoginViewController: UIViewController {

  @IBOutlet weak var btnFacebookLogin: LoginButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
  }
  
  @IBAction func btnLoginFacebook(_ sender: Any) {
    
    let loginManager = LoginManager()
    loginManager.logIn(readPermissions: [.publicProfile, .email, .userPhotos], viewController: self) { (LoginResult) in
      switch LoginResult {
      case .failed(let error):
        print(error)
      case .cancelled:
        print("User cancelled login")
      case .success(let grantedPermissions, let declinedPermissions, let accessToken):
        print("====> accessToken")
        print(accessToken)
        print("Logged in!")
        
      }
    }
  }
  
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("close")
    }
  }
  
  @IBAction func btnSignUp(_ sender: Any) {
    //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
    let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
    let SignUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
    
    navigationController?.pushViewController(SignUpVC, animated: true)
  }
  
}
