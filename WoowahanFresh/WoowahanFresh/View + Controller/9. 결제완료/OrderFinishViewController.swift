
//
//  OrderFinishViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 20/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class OrderFinishViewController: UIViewController {
 
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var labelPrice: UILabel!
  @IBOutlet weak var labelDate: UILabel!
  @IBOutlet weak var labelAdress: UILabel!
  
  var orderCheck: OrderCheck? {
    didSet {
      print("reloadData")
      tableView.reloadData()
    }
  }
  var orderPk = "" {
    didSet {
      print("didSet ", orderPk)
      requestOrder.isCheck(orderPk: orderPk) { (OrderCheck) in
        self.orderCheck = OrderCheck
      }
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    
    self.tableView.rowHeight = 100
    print("=======reloadData Start =======")
    tableView.reloadData()
    print("=======reloadData End =======")
    
    self.tableView.reloadData()
  }
  
}

extension OrderFinishViewController: UITableViewDataSource  {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    let count = orderCheck?.cartItems.count ?? 0
    print(count)
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    let company = orderCheck?.cartItems[indexPath.row].item.company ?? ""
    let name = orderCheck?.cartItems[indexPath.row].item.itemName ?? ""
    let image = orderCheck?.cartItems[indexPath.row].item.listThumbnail ?? ""
    
    
    cell.textLabel?.text = "[\(company)]"
    cell.detailTextLabel?.text = name
    requestImage.imageData(url: image) { (Data) in
      cell.imageView?.image = UIImage(data: Data)
    }
    
    return cell
    
    
  }
  
  
}
