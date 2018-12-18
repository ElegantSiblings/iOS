//
//  PaymentViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class PaymentViewController: UIViewController {

  //MARK: 현재 뷰에서 생성해야하는 값
  var _address = ""
  //MARK: 이전 뷰에서 생성해야하는 값
  var _deliveryDate = ""
  var _totalPrice = 0
  var _orderItemList: [Int] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()

      print("Payment View : ", _address)
      print("Payment View : ", _deliveryDate)
      print("Payment View : ", _totalPrice)
      print("Payment View : ", _orderItemList)
        // Do any additional setup after loading the view.
      
      requestCart.hitsItem { (ShoppingList) in
        print(ShoppingList.count)
        var tempPrice = 0
        for idx in 0..<ShoppingList.count {
          print("idx : ", ShoppingList[idx].cartItemPk)
          tempPrice = tempPrice + ShoppingList[idx].item.salePrice
          
        }
        print(tempPrice)
        
        print(ShoppingList)
      }
    }
  
  //TODO: 결제하기 배송지 입력하기
  @IBAction func btn결제하기(_ sender: Any) {
    
    _address = "충청남도 천안시 입장면"
    
    print("결제하기 버튼", _orderItemList)
    requestOrder.isPayment(address: _address,
                           date: _deliveryDate,
                           price: _totalPrice,
                           orderItemList: _orderItemList) { (OrderList) in
                            print("성공")
    }
    
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
