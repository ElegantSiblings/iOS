//
//  DeliveryDayViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import FSCalendar

class DeliveryDayViewController: UIViewController {
  
  @IBOutlet weak var labelDate: UILabel!
  
  var sumPrice = 0
  var deliveryPrice = 0
  var expectedPrice = 0
  var orderItemList: [Int] = []
  
  var cal = Calendar.current
  var currentDate = Date()
  var requestDate = ""
  var selectDate = "" {
    didSet {
      labelDate.text = selectDate
    }
  }
  
  var shoppingValue = ShoppingList()
  //MARK: 네비게이션 아이템 만들기
  var barItemClose = UIBarButtonItem(image: UIImage(named: "x"),
                                     style: UIBarButtonItem.Style.plain,
                                     target: self,
                                     action: #selector(btnClose) )
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.items![0].title = ""
    navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
    
    barItemClose.tintColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
    
    let year = cal.component(.year, from: currentDate)
    let month = cal.component(.month, from: currentDate)
    let day = cal.component(.day, from: currentDate)
    
    labelDate.text = "\(year)-\(month)-\(day)"
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
    PaymentVC._deliveryDate = requestDate
    PaymentVC._orderItemList = self.orderItemList
    
    print("보낼 때,", requestDate)
    navigationController?.pushViewController(PaymentVC, animated: true)
  }
}

extension DeliveryDayViewController: FSCalendarDelegate {
  func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "YYYY-MM-dd"
    let dateString = dateFormatter.string(from: date)
    selectDate = dateString
    requestDate = dateString
    print(date)
    print("선택",selectDate)
    //    print(dateString)
    //    print(date)
  }
}
