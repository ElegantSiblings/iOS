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
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if SingleUserInfo.sharedInstance.token.isEmpty {
      print("로그인해 주세요")
      Alert.loginCheck(viewController: self)
    } else {
      requestCart.hitsItem()
    }
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.sectionHeaderHeight = 5
    //    tableView.sectionFooterHeight = 0
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "deletionCell")
  }
  
  @IBAction func btnClose(_ sender: Any) {
    self.dismiss(animated: true) {
      print("쇼핑리스트 화면 닫으면서 전달 사항 있니?")
    }
  }
  
  
}


extension ShoppingListNavicationViewController: UITableViewDelegate {
  
}

extension ShoppingListNavicationViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 2{
      let cell = tableView.dequeueReusableCell(withIdentifier: "deletionCell", for: indexPath)
      cell.textLabel?.text = "deletionCell"
      return cell
    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.backgroundColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
    
    return cell
  }
  
  
}
