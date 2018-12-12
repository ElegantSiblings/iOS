//
//  ItemViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class ItemViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var timer = Timer()
  var itemPk: String? = nil
  var itemValue: ItemDetails?
  var itemThumbnail: [String] = []
  var itemThumbnailImage: [UIImage] = []
  var itemDeTalier: [String] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    //MARK: Section1 - 상품 정보 Custom Cell. 4개
    tableView.register(UINib(nibName: "ScrollViewImageCell", bundle: nil), forCellReuseIdentifier: "ScrollViewImageCell")
    tableView.register(UINib(nibName: "ItemTitleCell", bundle: nil), forCellReuseIdentifier: "ItemTitleCell")
    tableView.register(UINib(nibName: "ItemDeliveryCell", bundle: nil), forCellReuseIdentifier: "ItemDeliveryCell")
    tableView.register(UINib(nibName: "OtherItemCell", bundle: nil), forCellReuseIdentifier: "OtherItemCell")
    tableView.register(UINib(nibName: "ItemDetailCell", bundle: nil), forCellReuseIdentifier: "ItemDetailCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    guard let itemPkOptionalRemove = itemPk else {
      return
    }
    
    requestItem.detailInfo(pk: itemPkOptionalRemove) { (ItemDetails) in
      self.tableView.reloadData()
      
      let count = self.itemValue?.itemimageSet.count ?? 0
      self.itemValue = ItemDetails
      
      for idx in 0..<count {
        if self.itemValue?.itemimageSet[idx].photoType == "T" {
          let urlString = self.itemValue?.itemimageSet[idx].photo ?? "nil"
          self.itemThumbnail.append(urlString)
          
        } else {
          let urlString = self.itemValue?.itemimageSet[idx].photo ?? "nil"
          self.itemDeTalier.append(urlString)
          
        }
        
      }
      self.tableView.reloadData()
    }
  }
  
  //MARK: 이미지 데이터 요청
  func requestImage(url: String, handler: @escaping (Data) -> Void) {
    Alamofire.request(url, method: .get)
      .validate()
      .responseData { (response) in
        switch response.result {
        case .success(let value):
          handler(value)
          
        case .failure(let error):
          print("error = ", error.localizedDescription)
        }
        
    }
  }
  
  //MARK: 네비게이션 액션
  
  @IBAction func btnShare(_ sender: Any) {
    print("공유")
  }
  
  @IBAction func btnShopping(_ sender: Any) {
    print("쇼핑")
  }
  
  //MARK: 하단 버튼 액션
  
  @IBAction func btnHeart(_ sender: Any) {
    if SingleUserInfo.sharedInstance.token.isEmpty {
      Alert.loginCheck(viewController: self)
    } else {
      
    }
  }
  
  //MARK: 장바구니 담기 버튼,
  @IBAction func btnAddShoppingList(_ sender: Any) {
    
    if SingleUserInfo.sharedInstance.token.isEmpty {
      Alert.loginCheck(viewController: self)
    } else {
      let tempInt = Int(itemPk ?? "0")
      guard let removeOtionalInt = tempInt else { return }
      requestCart.addItem(item_pk: removeOtionalInt)
      Alert.addItem(viewController: self)
    }
  }
  
}

extension ItemViewController: UITableViewDataSource {
  //MARK: Section 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  //MARK: Section의 이름
  func tableView(_ tableView: UITableView,
                 titleForHeaderInSection section: Int) -> String? {
    if section == 1 {
      return "test"
    } else {
      return ""
    }
  }
  
  //MARK: taview 높이
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if indexPath.section == 0 {
      
      //MARK: 상품 이미지
      switch indexPath.row {
      case 0 :
        let size = CGFloat( ( Int(self.tableView.frame.maxY) / 4) * 2 )
        return size
        
      //MARK: 상품명 가격 정보
      case 1 :
        let size = CGFloat( ( Int(self.tableView.frame.maxY) / 4) * 1 )
        return size
        
      //MARK: 배송타입
      case 2 :
        let size = CGFloat( ( Int(self.tableView.frame.maxY) / 4) * 1 )
        return size
        
      //MARK: 다른상품
      case 3 :
        let size = CGFloat( ( Int(self.tableView.frame.maxY) / 4) * 2 )
        return size
        
      default:
        return 50
      }
      
      //MARK: section 2 - 상세보기, 후기, 문의, 배송 교환
    } else {
      
      let size = CGFloat( ( Int(self.tableView.frame.maxY) / 4) * 3 )
      return size
    }
  }
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 4
    } else {
      return itemDeTalier.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //MARK: Section1 - 상품 정보 Custom Cell.
    if indexPath.section == 0 {
      
      //MARK: 상품 이미지
      switch indexPath.row {
      case 0 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollViewImageCell", for: indexPath) as! ScrollViewImageCell
        
        return cell
        
      //MARK: 상품명 가격 정보
      case 1 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleCell", for: indexPath) as! ItemTitleCell
        
        
        let company = itemValue?.company ?? ""
        let title = itemValue?.itemName ?? ""
        let subtile = itemValue?.description.addedWords ?? ""
        let discountRate = itemValue?.discountRate ?? 0.0
        let saleMoney = itemValue?.salePrice ?? 0
        let originMoney = itemValue?.originPrice ?? 0
        switch discountRate {
        case 0.05:
          cell.disCount.text = " 5%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        case 0.1:
          cell.disCount.text = "10%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        case 0.2:
          cell.disCount.text = "20%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        case 0.25:
          cell.disCount.text = "25%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        default:
          cell.disCount.text = ""
          cell.disCount.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
          break
        }
        cell.title.text = "[\(company)] \(title)"
        cell.subTitle.text = subtile
        cell.salePrice.text = String(saleMoney)
        cell.originPrice.text = String(originMoney)
        
        return cell
        
      //MARK: 배송타입
      case 2 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDeliveryCell", for: indexPath) as! ItemDeliveryCell
        
        //MARK: 짤리는거는 나중에
        cell.deliveryType.text = itemValue?.description.deliveryType
        cell.getItemDay.text = itemValue?.description.receiveDay
        
        let rule = itemValue?.description.regularDelivery ?? false
        var ruleText = "정기배송"
        if rule {
          ruleText = "가능"
        } else {
          ruleText = "불가능"
        }
        cell.deliveryRule.text = ruleText
        return cell
        
      //MARK: 다른상품
      case 3 :
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherItemCell", for: indexPath) as! OtherItemCell
        return cell
        
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
      }
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailCell", for: indexPath) as! ItemDetailCell
      
      requestImage(url: itemDeTalier[indexPath.row]) { (Data) in
        
        guard let img = UIImage(data: Data) else { fatalError("Bad data") }
        cell.imageView?.image = img
      }
      
      //MARK: 이미지 늘어남 해결 안됨
      cell.imageView?.clipsToBounds = true
      cell.imageView?.contentMode = .scaleAspectFit
      
      return cell
    }
    
  }
}

extension ItemViewController: UITableViewDelegate {
  
}
