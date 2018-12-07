//
//  DishTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 07/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class SubDishTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var itemValue: ItemList?
  var itemValueListThumbnail: [Data] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    
    tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    requestCategoryPK(pk: "1") { (ItemList) in
      print("====== 콜백")
      
      self.tableView.reloadData()
    }
    
    
  }
  
  
  @IBAction func btnBack(_ sender: Any) {
    self.dismiss(animated: true) {
      print("close")
    }
  }
  
  func requestImage(url: String, handler: @escaping (Data) -> Void) {
    //MARK: 이미지 데이터 요청
    Alamofire.request(url, method: .get)
      .validate()
      .responseData { (response) in
        print(Alamofire.request(url, method: .get))
        switch response.result {
        case .success(let value):
          handler(value)
          
        case .failure(let error):
          print("error = ", error.localizedDescription)
        }
        
    }
  }
  
  func requestCategoryPK(
    pk: String,
    completionHandler: @escaping (ItemList) -> Void
    ) {
    let url = "https://api.elegantsiblings.xyz/categories/"
    
    //?category_pk=2&is_ios=true
    let params: Parameters = [
      "category_pk": pk,
      //"is_ios" : "true"
    ]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let value):
          print("====성공")
          //let itemListData
          self.itemValue = try! JSONDecoder().decode(ItemList.self, from: value)
          
          /*
          for idx in 0..<(self.itemValue?.itemList.count ?? 0) {
            guard let urlIn = self.itemValue?.itemList[idx].listThumbnail else {return}
            self.requestImage(url: urlIn, handler: { (Data) in
              //                  print("콜백완료")
              //                  print("==Data == : ", Data)
              //                  print("==Data.count == : ", idx)
//              self.itemValueListThumbnail += [Data]
              print("============", Data)
              
            })
          }
           */
          print("============== 이미지 완료")
          self.tableView.reloadData()
          
        case .failure(let error):
          print(error)
        }
    }
  }
}




extension SubDishTableViewController: UITableViewDataSource {
  
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    guard let cellCount = itemValue?.itemList.count else { return 0 }
    print("Cell의 갯수", cellCount)
    
    //    print("itemValueListThumbnail.count", itemValueListThumbnail.count)
    return cellCount
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
    
    //MARK: Item pk
    cell.itemPkNumber = itemValue?.itemList[indexPath.row].itemPk ?? "nil"
    //MARK: Item 제목 회사 + 아이템 이름
    cell.titel.text = "[\(itemValue?.itemList[indexPath.row].company ?? "nil") ] " + "\(itemValue?.itemList[indexPath.row].itemName ?? "nil")]"
    //MARK: Item 세일가격
    cell.salePrice.text = String(itemValue?.itemList[indexPath.row].salePrice ?? 0)// ?? "nil"
    //MARK: Item 원래 가격
    cell.originPrice.text = String(itemValue?.itemList[indexPath.row].originPrice ?? 0)
    //MARK: Item discount
    if let discountRateValue = itemValue?.itemList[indexPath.row].discountRate {
      
      switch discountRateValue {
      case 0:
        break
      case 0.05:
        cell.discountRate.text = "5%"
        cell.discountRate.backgroundColor = .red
        
      case 0.1:
        cell.discountRate.text = "10%"
        cell.discountRate.backgroundColor = .red
        
      case 0.25:
        cell.discountRate.text = "25%"
        cell.discountRate.backgroundColor = .red
      default:
        break
      }
    }
    
    
    //MARK: Item Thumbnail
    if itemValueListThumbnail.isEmpty {
      print("itemValueListThumbnail is Empty !!!!! ")
    } else {
      cell.listThumbnail.image = UIImage(data: itemValueListThumbnail[0])
    }
    /*
     if checkThumbnail {
     print(indexPath.row)
     print(itemValueListThumbnail.count)
     cell.listThumbnail.image = UIImage(data: itemValueListThumbnail[0])
     print(indexPath.row)
     } else {
     cell.listThumbnail.image = UIImage(data: itemValueListThumbnail[0])
     }
     */
    
    
    return cell
    
    
  }
  
  //MARK: taview
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    /*
    switch indexPath.row {
    case 0 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 3 )
      return size
      
    case 1 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 1 )
      return size
      
    default:
      return 315
    }
    */
    return 315
  }
}

extension SubDishTableViewController: UITableViewDelegate {
  
}
