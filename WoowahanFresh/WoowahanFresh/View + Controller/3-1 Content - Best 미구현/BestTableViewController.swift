//
//  BestTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 30/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class BestTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  let url = "https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/main_banner_01.jpg"
  
  var dataTest: Data?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    requestData(url: url) { (Data) in
      self.dataTest = Data
      
      self.tableView.reloadData()
    }
  }
}

func requestData(url: String, handler: @escaping (Data) -> Void) {
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

extension BestTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = "\(indexPath.row)"
    if let data = self.dataTest {
      cell.imageView?.image = UIImage(data: data)
    }
    return cell
  }
  
  
}

extension BestTableViewController: UITableViewDelegate {
  
}
