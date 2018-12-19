//
//  DeliveryDayViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class DeliveryDayViewController: UIViewController {
  
  var sumPrice = 0
  var deliveryPrice = 0
  var expectedPrice = 0
  var orderItemList: [Int] = []
  
  var shoppingValue = ShoppingList()
  //MARK: 네비게이션 아이템 만들기
  var barItemClose = UIBarButtonItem(image: UIImage(named: "x"),
                                     style: UIBarButtonItem.Style.plain,
                                     target: self,
                                     action: #selector(btnClose) )
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //MARK: 네비게이션 아이템 추가하기
    navigationItem.setRightBarButton(barItemClose, animated: true)
    
    print("=== === === ")
    print("상품금액 ", sumPrice)
    print("배송비 ", deliveryPrice)
    print("결제 예상금액 ", expectedPrice)
    print("orderItem ", orderItemList)
    
    requestCart.hitsItem { (ShoppingList) in
      self.shoppingValue = ShoppingList
    }
    // Do any additional setup after loading the view.
  }
  
  @objc func btnClose() {
    self.dismiss(animated: true)
    print("btnClose, 기능추가할 것")
  }
  
  @IBAction func btnOrder(_ sender: Any) {
    //TODO: 배송 날짜 선택해서 넘기기, 최종 금액이랑
    
    print("======주문하기 버튼 :", self.orderItemList)
    let storyboard = UIStoryboard(name: "Payment", bundle: nil)
    let PaymentVC = storyboard.instantiateViewController(withIdentifier: "PaymentViewController") as! PaymentViewController
    PaymentVC._totalPrice = self.expectedPrice
    PaymentVC._deliveryDate = "2018-12-25"
    PaymentVC._orderItemList = self.orderItemList
    navigationController?.pushViewController(PaymentVC, animated: true)
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
