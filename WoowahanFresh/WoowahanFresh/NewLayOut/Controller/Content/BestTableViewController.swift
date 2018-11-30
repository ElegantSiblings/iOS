//
//  BestTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 30/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class BestTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
}

extension BestTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 100
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = "\(indexPath.row)"
    
    return cell
  }
  
  
}

extension BestTableViewController: UITableViewDelegate {
  
}
