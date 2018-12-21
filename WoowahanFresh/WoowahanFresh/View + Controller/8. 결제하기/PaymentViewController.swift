//
//  PaymentViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import WebKit

protocol didSetDelegate {
  func tableViewReload()
}

class PaymentViewController: UIViewController {
  
  @IBOutlet weak var userName: UILabel!
  @IBOutlet weak var txtFieldUserName: UITextField!
  @IBOutlet weak var txtFieldTelNumber: UITextField!
  @IBOutlet weak var txtFieldPhoneNumber: UITextField!
  @IBOutlet weak var txtFieldPostCode: UITextField!
  @IBOutlet weak var txtFieldAdrees: UITextField!
  
  @IBOutlet weak var btnOrder: UIButton!
  
  var delegateDidSet: didSetDelegate?
  
  //MARK: 현재 뷰에서 생성해야하는 값
  var _address = ""
  //MARK: 이전 뷰에서 생성해야하는 값
  var _deliveryDate = ""
  var _totalPrice = 0
  var _orderItemList: [Int] = []
  
  let url = URL(string: "https://qbbang.github.io/postcode/")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //    navigationController?.navigationBar.items![0].title = ""
    navigationController?.navigationBar.items![1].title = ""
    
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
    print("결제하기 버튼", _orderItemList)
    requestOrder.isPayment(address: txtFieldAdrees.text!,
                           date: _deliveryDate,
                           price: _totalPrice,
                           orderItemList: _orderItemList) { (OrderResult) in
                            
                            let storyboard = UIStoryboard(name: "OrderFinish", bundle: nil)
                            let OrderVC = storyboard.instantiateViewController(withIdentifier: "OrderFinishViewController") as! OrderFinishViewController
                            
                            self.present(OrderVC, animated: true, completion: {
                              print("totalPrice", OrderResult.totalPrice)
                              let temp = String(OrderResult.totalPrice)
                              let total = temp
                              OrderVC.labelPrice.text = total
                              OrderVC.labelDate.text = OrderResult.deliveryDate
                              OrderVC.labelAdress.text = OrderResult.address
                              OrderVC.orderPk = String(OrderResult.pk)
                              print("OrderResult.pk : ", OrderResult.pk)
                            })
    }
    
  }
  
}
