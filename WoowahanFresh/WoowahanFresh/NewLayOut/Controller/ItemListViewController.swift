//
//  ItemViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ItemListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  @IBOutlet weak var titleStr: UILabel!
  @IBOutlet weak var labelTest: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "ImageViewCell")
    tableView.register(UINib(nibName: "CollectionCategoriesCell", bundle: nil), forCellReuseIdentifier: "CollectionCategoriesCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
  }
  
  @IBAction func btnClose(_ sender: Any) {
    print("-----btn")
    self.dismiss(animated: false) {
      print("쇼핑리스트 화면 닫으면서 전달 사항 있니?")
    }
  }
  
  @IBAction func btnShopping(_ sender: Any) {
    
  }
  
}


extension ItemListViewController: UITableViewDataSource {
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //MARK:
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath) as! ImageViewCell
      cell.textLabel?.text = "\(indexPath.section) & \(indexPath.row)"
      return cell
      
    } else if indexPath.row == 1 {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionCategoriesCell", for: indexPath) as! CollectionCategoriesCell
      cell.textLabel?.text = "\(indexPath.section) & \(indexPath.row)"
      
      return cell
      
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      return cell
    }
    
  }
  
  //MARK: taview
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch indexPath.row {
    case 0 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 3 )
      print(size)
      return size
      
    case 1 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 2 )
      print(size)
      return size
      
    default:
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 1 )
      print(size)
      return size
    }
    
  }
}

extension ItemListViewController: UITableViewDelegate {
  
}
