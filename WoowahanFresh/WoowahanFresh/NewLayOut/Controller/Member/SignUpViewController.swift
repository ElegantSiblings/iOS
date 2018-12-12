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
  
  @IBOutlet weak var textFieldId: UITextField!
  
  
  @IBOutlet weak var textFieldPassword: UITextField!
  @IBOutlet weak var texFieldPasswordCheck: UITextField!
  
  @IBOutlet weak var textFieldFirstName: UITextField!
  
  @IBOutlet weak var textFieldLastName: UITextField!
  
  @IBOutlet weak var textFieldEmail: UITextField!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    textFieldId.delegate = self
    textFieldPassword.delegate = self
    texFieldPasswordCheck.delegate = self
    textFieldFirstName.delegate = self
    textFieldLastName.delegate = self
    textFieldEmail.delegate = self
  }
  
  
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("btn close")
    }
  }
  
  @IBAction func btnSignUp(_ sender: Any) {
    
    guard let emailisEmpty = textFieldId.text?.isEmpty,
      let passisEmpty = textFieldPassword.text?.isEmpty else { return }
    
    if emailisEmpty {
      print("닉네임 입력하세요 팝업 띄우기")
    } else if passisEmpty {
      print("비밀번호 입력하세요 팝업 띄우기")
    }
    
    requestSignUp()
  }
  
  //MARK: post 요청
  func requestSignUp() {
    //handler: @escaping () -> Void {
    let url = "https://api.elegantsiblings.xyz/members/signup/"
    
    guard let username = textFieldId.text else { return }
    guard let password = textFieldPassword.text else { return }
    guard let first_name = textFieldFirstName.text else { return }
    guard let last_name = textFieldLastName.text else { return }
    guard let email = textFieldEmail.text else { return }
    
    let params: Parameters = [
      "username": username,
      "password": password,
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "img_profile": ""
    ]
    
    Alamofire.request(url, method: .post, parameters: params)
      .validate()
      .responseJSON { response in
        
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success(let value):
            print("=========")
            print(value)
            //MARK: 회원가입이 완료 되었습니다 알람
            self.alertSingUpFinish()
          case .failure(let error):
            print(error)
          }
        } else if response.response?.statusCode == 400 {
          guard let code = response.response?.statusCode else { return }
          print(code)
          
          //MARK: 아이디가 중복 되었습니다 알람
          self.alertBedRequest()
        } else {
          guard let code = response.response?.statusCode else { return }
          print(code)
        }
    }
  }
  
  //MARK: 알림 창 - Status 200
  func alertSingUpFinish() {
    let alert = UIAlertController(title: "회원가입이 완료되었습니다.", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      self.dismiss(animated: true, completion: {
        print("close")
      })
    }))
    
    self.present(alert, animated: true)
  }
  
  //MARK: 알림 창 - Status 400
  func alertBedRequest() {
    let alert = UIAlertController(title: "아이디가 중복 되었습니다.", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
      alert.dismiss(animated: true, completion: {
        print("Alert Close")
      })
    }))
    
    self.present(alert, animated: true)
  }
  
  
  //MARK: 터치 시 키보드 하이드
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
    
    self.view.endEditing(true)
    
  }
  
}

extension SignUpViewController: UITextFieldDelegate {
  
}





