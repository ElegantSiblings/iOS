//
//  DishTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 07/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class DishCategoryTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  var itemValue: ItemList?
  var requestPK: String = "1"
  var tempimageList: [UIImage] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("==== 현재 뷰컨트롤러 [DishCategoryTableViewController] ====")
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    
    tableView.register(UINib(nibName: "ItemCell", bundle: nil),
                       forCellReuseIdentifier: "ItemCell")
    
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
    print("=============", requestPK)
    
    requestCategory.listInfo(pk: requestPK) { [weak self] (ItemList) in
      
      guard let self = self else { return }
      self.itemValue = ItemList
      self.tableView.reloadData()
    }
    
    tableView.reloadData()
  }
  
  
  @IBAction func unwindTo(_ unwindSegue: UIStoryboardSegue) {
  }
  
  //MARK: 이미지 데이터 요청
  func requestImage(url: String, handler: @escaping (Data) -> Void) {
    Alamofire.request(url, method: .get)
      .validate()
      .responseData { (response) in
        //      print(Alamofire.request(url, method: .get))
        switch response.result {
        case .success(let value):
          handler(value)
          
        case .failure(let error):
          print("error = ", error.localizedDescription)
        }
        
    }
  }
  
  
  
}




extension DishCategoryTableViewController: UITableViewDataSource, ItemCellDelegate {
  
  //MARK: Section 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section == 0 {
      return 1
    } else if section == 1{
      guard let cellCount = itemValue?.itemList.count else { return 0 }
      return cellCount
    } else {
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      
      cell.textLabel?.text = "\(indexPath.section)" + "\(indexPath.row)"
      cell.backgroundColor = .yellow
      return cell
      
    } else if indexPath.section == 1 {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
      
      //MARK: Item pk
      cell.itemPkNumber = itemValue?.itemList[indexPath.row].itemPk ?? "nil"
      let temp = itemValue?.itemList[indexPath.row].itemPk ?? "nil"
      //MARK: Item 제목 회사 + 아이템 이름
      cell.titel.text = "(\(temp)) [\(itemValue?.itemList[indexPath.row].company ?? "nil") ] " + "\(itemValue?.itemList[indexPath.row].itemName ?? "nil")]"
      //MARK: Item 세일가격
      cell.salePrice.text = String(itemValue?.itemList[indexPath.row].salePrice ?? 0)
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
      let inputUrl = itemValue?.itemList[indexPath.row].listThumbnail ?? "nil"
      requestImage(url: inputUrl) { (Data) in
        
        cell.listThumbnail.image = UIImage(data: Data)
      }
      
      cell.delegate = self
      
      
      
      return cell
      
    } else {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      
      cell.textLabel?.text = "\(indexPath.section)" + "\(indexPath.row)"
      cell.backgroundColor = .yellow
      return cell
      
    }
    
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
  
  func DidTabCell() {
    print("CEll")
  }
  
  func DidTabHeart() {
    print("heart")
  }
  
  func DidTabShopping() {
    print("Shopping")
  }
}

extension DishCategoryTableViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if indexPath.section == 0 {
      
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
      
      print(cell.itemPkNumber)
      
      //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
      let storyboard = UIStoryboard(name: "Item", bundle: nil)
      let ItemVC = storyboard.instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
      
      ItemVC.itemPk = cell.itemPkNumber
      navigationController?.pushViewController(ItemVC, animated: true)
    } else {
      
    }
    
  }
  
  
}



