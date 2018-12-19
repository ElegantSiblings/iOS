//
//  ShoppingListNavicationViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 02/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit


class ShoppingListNavicationViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var total = 0
  var delivery = 0
  var order = 0
  var orderShoppingList: [Int] = []
  var shoppingValue = ShoppingList()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("==== 현재 뷰컨트롤러 [ShoppingListNavicationViewController] ====")
    if SingleUserInfo.sharedInstance.token.isEmpty {
      print("로그인해 주세요")
      Alert.loginCheck(viewController: self)
    } else {
      requestCart.hitsItem { (ShoppingList) in
        self.shoppingValue = ShoppingList
        self.tableView.reloadData()
      }
    }
    
    print("토큰정보")
    print(SingleUserInfo.sharedInstance.token)
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.sectionHeaderHeight = 5
    tableView.sectionFooterHeight = 5
    
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
    tableView.register(UINib(nibName: "DeletionCell", bundle: nil), forCellReuseIdentifier: "DeletionCell")
    tableView.register(UINib(nibName: "AddItemCell", bundle: nil), forCellReuseIdentifier: "AddItemCell")
    tableView.register(UINib(nibName: "HopeCell", bundle: nil), forCellReuseIdentifier: "HopeCell")
    
  }
  
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("쇼핑리스트 화면 닫으면서 전달 사항 있니?")
    }
  }
}


extension ShoppingListNavicationViewController: UITableViewDelegate {
}

extension ShoppingListNavicationViewController: UITableViewDataSource, HopeCellDelegate {
  func DidTabHopeDate() {
    let storyboard = UIStoryboard(name: "DeliveryDay", bundle: nil)
    let DeliveryDayVC = storyboard.instantiateViewController(withIdentifier: "DeliveryDayViewController") as! DeliveryDayViewController
    DeliveryDayVC.sumPrice = self.total
    DeliveryDayVC.deliveryPrice = delivery
    DeliveryDayVC.expectedPrice = order
    
    for idx in 0..<shoppingValue.count {
      orderShoppingList.append(shoppingValue[idx].pk)
    }
    
    DeliveryDayVC.orderItemList = orderShoppingList
    print("======orderShoppingList:", orderShoppingList)
    navigationController?.pushViewController(DeliveryDayVC, animated: true)
  }
  
  func DidTabContinue() {
    print("DidTabContinue")
    self.dismiss(animated: true) {
      
    }
  }
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section == 0 {
      return 1
    } else if section == 1 {
      return shoppingValue.count
    } else if section == 2 {
      return 1
    } else {
      return 0
    }
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    if indexPath.section == 2 {
      return 286
    } else {
      return UITableView.automaticDimension
    }
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //MARK section1 = 전체삭제
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "DeletionCell", for: indexPath) as! DeletionCell
      
      return cell
    } else if indexPath.section == 1 {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "AddItemCell", for: indexPath) as! AddItemCell
      let value = shoppingValue[indexPath.row].item.salePrice * shoppingValue[indexPath.row].amount
      let inputUrl = shoppingValue[indexPath.row].item.listThumbnail
      
      cell.labelCompany.text = "\(shoppingValue[indexPath.row].item.company)"
      
      cell.labelName.text = "\(shoppingValue[indexPath.row].item.itemName)"
      
      cell.textPrice.text = "\(shoppingValue[indexPath.row].item.salePrice)원"
      
      cell.textFieldCount.text = "\(shoppingValue[indexPath.row].amount)"
      
      cell.textOrderPrice.text = "\(value)원"
      
      requestData(url: inputUrl) { (Data) in
        cell.imagethumbnail.image = UIImage(data: Data)
      }
      return cell
    } else if indexPath.section == 2 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "HopeCell", for: indexPath) as! HopeCell
      var tempTotal = 0
      for idx in 0..<shoppingValue.count {
        tempTotal += (shoppingValue[idx].amount * shoppingValue[idx].item.salePrice)
      }
      total = tempTotal
      print(total)
      cell.delegate = self
      cell.orderPrice.text = "\(total)원"
      if tempTotal < 40000 {
        let tempDelivery = 2500
        cell.deliveryPrice.text = "\(tempDelivery)원"
        delivery = tempDelivery
      } else {
        let tempDelivery = 0
        cell.deliveryPrice.text = "\(tempDelivery)원"
        delivery = tempDelivery
      }
      let tempOrder = total + delivery
      order = tempOrder
      cell.totalPrice.text = "\(tempOrder)원"
      cell.setNeedsLayout()
      
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      
      cell.textLabel?.text = "\(indexPath.section) \(indexPath.row)"
      
      return cell
    }
  } 
}
