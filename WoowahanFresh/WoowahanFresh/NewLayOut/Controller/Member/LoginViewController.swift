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
import Alamofire
//import FBSDKLoginKit

class LoginViewController: UIViewController {

  @IBOutlet weak var txtFieldID: UITextField!
  @IBOutlet weak var txtFieldPW: UITextField!
  @IBOutlet weak var btnFacebookLogin: LoginButton!
  
  var LoginValue: UserInfo?
  
  override func viewDidLoad() {
        super.viewDidLoad()
    print(SingleUserInfo.sharedInstance.token)
    
  }
  
  //MARK: 로그인 버튼
  @IBAction func btnLogin(_ sender: Any) {
    
    guard let txtID = txtFieldID.text else { return }
    guard let txtPW = txtFieldPW.text else { return }
    
    if txtID.isEmpty {
      alertMissID()
    } else if txtPW.isEmpty {
      alertMissPW()
    } else {
      requestLogin(id: txtID, pw: txtPW) { (UserInfo) in
        print("로그인 성공")
        SingleUserInfo.sharedInstance.token = (self.LoginValue?.token)!
        SingleUserInfo.sharedInstance.username = (self.LoginValue?.user.username)!

        self.dismiss(animated: true, completion: {
          print("close")
        })
      }
    }
    
  }
  
  //MARK: 페이스북 로그인 버튼
  //TODO: 토큰은 받아오는데 그 외 정보 못 받아옴
  @IBAction func btnLoginFacebook(_ sender: Any) {
    
    let loginManager = LoginManager()
    loginManager.logIn(readPermissions: [.publicProfile, .email, .userPhotos], viewController: self) { (LoginResult) in
      switch LoginResult {
      case .failed(let error):
        print(error)
      case .cancelled:
        print("User cancelled login")
      case .success(let accessToken):
        //(let grantedPermissions, let declinedPermissions, let accessToken):
        print("====> accessToken")
        print(accessToken)
        print("Logged in!")
        
      }
    }
  }
  
  //MARK: 화면 닫기 버튼
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("close")
    }
  }
  
  //MARK: 회원가입 버튼
  @IBAction func btnSignUp(_ sender: Any) {
    //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
    let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
    let SignUpVC = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
    
    navigationController?.pushViewController(SignUpVC, animated: true)
  }
  
  //MARK: Method Group
  //MARK: Method 로그인 요청
  func requestLogin(id: String, pw: String, handler: @escaping (UserInfo) -> Void) {
    let url = "https://api.elegantsiblings.xyz/members/login/"
    
    
    let params: Parameters = [
      "username": id,
      "password": pw,
    ]
    
    Alamofire.request(url, method: .post, parameters: params)
      .validate()
      .responseData { response in
        
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success(let value):
            self.LoginValue = try! JSONDecoder().decode(UserInfo.self, from: value)
            handler(self.LoginValue!)
            print(value)
            
          case .failure(let error):
            print(error)
          }
        } else if response.response?.statusCode == 400 {
          print("username, password를 입력하지 않을떄")
          print("입력에서 예외처리함으로 나올 수 없음")
        } else if response.response?.statusCode == 401 {
          self.alertMissMatchIDPW()
        } else {
          guard let code = response.response?.statusCode else { return }
          print(code)
        }
    }
  }
  
  //MARK: Method Alert - 아이디를 입력하세요
  func alertMissID() {
    let alert = UIAlertController(title: "아이디를 입력하세요.", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      alert.dismiss(animated: true, completion: {
      })
    }))
    self.present(alert, animated: true)
  }
  //MARK: Method Alert - 비밀번호를 입력하세요
  func alertMissPW() {
    let alert = UIAlertController(title: "비밀번호를 입력하세요.", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      alert.dismiss(animated: true, completion: {
      })
    }))
    self.present(alert, animated: true)
  }
  //MARK: Method Alert - 아이디, 비밀번호를 확인하세요
  func alertMissMatchIDPW() {
    let alert = UIAlertController(title: "아이디, 비밀번호를 확인하세요.", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      alert.dismiss(animated: true, completion: {
      })
    }))
    self.present(alert, animated: true)
  }
}
