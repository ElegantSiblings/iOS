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
  var itemValueListThumbnail = [ItemListElement]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    
    tableView.register(UINib(nibName: "ItemCell", bundle: nil),
                       forCellReuseIdentifier: "ItemCell")
    
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
    
    requestCategoryPK(pk: "1") { (ItemList) in
      self.tableView.reloadData()
      
      //      let inUrl = self.itemValue?.itemList[1].listThumbnail ?? "nil"
      //      self.requestImage(url: inUrl, handler: { (Data) in
      //        print("데이터 -> 이미지 ", Data)
      //        self.itemValueListThumbnail.append(Data)
      //        self.tableView.reloadData()
      //      })
      
      print("콜백백백============== ")
    }
    
    
  }
  
  //MARK: 화면 닫기 버튼, dismiss
  @IBAction func btnBack(_ sender: Any) {
    self.dismiss(animated: true) {
      print("close")
    }
  }
  
  //MARK: 이미지 데이터 요청
  func requestImage(url: String, handler: @escaping (Data) -> Void) {
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
  
  //MARK: category_pk 요청
  func requestCategoryPK(
    pk: String,
    handler: @escaping (ItemList) -> Void
    ) {
    let url = "https://api.elegantsiblings.xyz/categories/"
    
    //?category_pk=2&is_ios=true
    let params: Parameters = [
      "category_pk": pk,
      "is_ios" : "true"
    ]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let value):
          self.itemValue = try! JSONDecoder().decode(ItemList.self, from: value)
          handler(self.itemValue!)
          
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
           print("============== 이미지 완료")
           */
          //          self.tableView.reloadData()
          
        case .failure(let error):
          print(error)
        }
    }
  }
}




extension SubDishTableViewController: UITableViewDataSource, ItemCellDelegate {
  
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
      print("Cell의 갯수", cellCount)
      return cellCount
    } else {
      return 1
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 1 {
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
    //    cell.listThumbnail.image = UIImage(data: itemValueListThumbnail[indexPath.row])
    
    if let url = itemValue?.itemList[indexPath.row].listThumbnail {
      
      requestImage(url: url) { (Data) in
        print("이미지 요청 콜백", Data)
        cell.listThumbnail.image = UIImage(data: Data)
        //     tableView.reloadData()
      }
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

extension SubDishTableViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("\(indexPath.section) + \(indexPath.row)")
    
    let storyboard = UIStoryboard(name: "Item", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    //let nextVC = storyboard.instantiateViewController(withIdentifier: "DishTableViewController") as! DishTableViewController
    
    self.present(masterVC, animated: true, completion: {
      //      DispatchQueue.main.async {
      //        nextVC.testString = "밑반찬"
      //        nextVC.navigationItem.title = "밑반찬"
    })
    
  }
  
}
