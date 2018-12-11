//
//  SignUpViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 11/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {
  
  @IBOutlet weak var textFieldUsername: UITextField!
  @IBOutlet weak var textFieldPassword: UITextField!
  @IBOutlet weak var texFieldPasswordCheck: UITextField!
  @IBOutlet weak var textFieldFistName: UITextField!
  @IBOutlet weak var textFieldLastName: UITextField!
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textFieldUsername.delegate = self
    textFieldPassword.delegate = self
    texFieldPasswordCheck.delegate = self
    textFieldFistName.delegate = self
    textFieldLastName.delegate = self
  }
  
  
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("btn close")
    }
  }
  
  @IBAction func btnSignUp(_ sender: Any) {
    
    guard let emailisEmpty = textFieldUsername.text?.isEmpty,
      let passisEmpty = textFieldPassword.text?.isEmpty else { return }
    
    if emailisEmpty {
      print("닉네임 입력하세요 팝업 띄우기")
    } else if passisEmpty {
      print("비밀번호 입력하세요 팝업 띄우기")
    }
    
    requestItemPK()
    
  }
  
  //MARK: post 요청
  func requestItemPK() {
  //handler: @escaping () -> Void {
    let url = "https://api.elegantsiblings.xyz/members/signup/"
    
    guard let username = textFieldUsername.text else { return }
    guard let passwd = textFieldPassword.text else { return }
    guard let firstname = textFieldFistName.text else { return }
    guard let lastname = textFieldLastName.text else { return }
    
    let params: Parameters = [
      "username": username,
      "password": passwd,
      "first_name": firstname,
      "last_name": lastname,
      "img_profile": ""
    ]
    
    Alamofire.request(url, method: .post, parameters: params)
      .validate()
      .responseJSON { response in
        switch response.result {
        case .success(let value):
          print("==== success ====")
          print(value)
        case .failure(let error):
          print("==== failure ====")
          print(error)
        }
    }
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    
    self.view.endEditing(true)
    
  }
  
}

extension SignUpViewController: UITextFieldDelegate {
  
}
