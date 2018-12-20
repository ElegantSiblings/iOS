//
//  PaymentViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import WebKit

class PaymentViewController: UIViewController {
  
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var txtFieldUserName: UITextField!
  @IBOutlet weak var txtFieldTelNumber: UITextField!
  @IBOutlet weak var txtFieldPhoneNumber: UITextField!
  @IBOutlet weak var txtFieldPostCode: UITextField!
  @IBOutlet weak var txtFieldAdrees: UITextField!
  
  @IBOutlet weak var btnOrder: UIButton!
  
  //MARK: 현재 뷰에서 생성해야하는 값
  var _address = ""
  //MARK: 이전 뷰에서 생성해야하는 값
  var _deliveryDate = ""
  var _totalPrice = 0
  var _orderItemList: [Int] = []
  
  let url = URL(string: "https://qbbang.github.io/postcode/")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    btnOrder.isHidden = true
    
    userName.text = SingleUserInfo.sharedInstance.username
    txtFieldUserName.text = SingleUserInfo.sharedInstance.username
    
    
    print("Payment View : ", _address)
    print("Payment View : ", _deliveryDate)
    print("Payment View : ", _totalPrice)
    print("Payment View : ", _orderItemList)
    // Do any additional setup after loading the view.
    
  }
  
  @IBAction func btnSearchAddress(_ sender: Any) {
    
  }
  
  
  @IBAction func unwindToPaymentView(_ unwindSegue: UIStoryboardSegue) {
  }
  
  //TODO: 결제하기 배송지 입력하기
  @IBAction func btn결제하기(_ sender: Any) {
    
    _address = "New York"
    
    print("결제하기 버튼", _orderItemList)
    requestOrder.isPayment(address: txtFieldAdrees.text!,
                           date: _deliveryDate,
                           price: _totalPrice,
                           orderItemList: _orderItemList) { (OrderResult) in
                            print("성공")
    }
    
  }
  
}
