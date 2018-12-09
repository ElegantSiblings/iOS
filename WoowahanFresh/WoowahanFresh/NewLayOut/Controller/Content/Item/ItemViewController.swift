//
//  ItemViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
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
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
  }
  
  //MARK: 네비게이션 액션
  @IBAction func btnBack(_ sender: Any) {
    self.dismiss(animated: true) {
      print("close")
    }
  }
  
  @IBAction func btnShare(_ sender: Any) {
    print("공유")
  }
  
  @IBAction func btnShopping(_ sender: Any) {
    print("쇼핑")
  }
  
  //MARK: 하단 버튼 액션
  
  @IBAction func btnHeart(_ sender: Any) {
    print("버튼 하트")
  }
  
  @IBAction func btnAddShoppingList(_ sender: Any) {
    print("쇼핑 리스트 담기")
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
      
      return 315
    }
  }
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 4
    } else {
      return 5
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
        return cell
        
      //MARK: 배송타입
      case 2 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDeliveryCell", for: indexPath) as! ItemDeliveryCell
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
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      return cell
    }
    
  }
  
  
}

extension ItemViewController: UITableViewDelegate {
  
}
