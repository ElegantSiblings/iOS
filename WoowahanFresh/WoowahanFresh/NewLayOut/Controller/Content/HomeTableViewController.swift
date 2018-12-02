//
//  HomeTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 29/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class HomeTableViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

      
      tableView.delegate = self
      tableView.dataSource = self
      tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
}

extension HomeTableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    switch indexPath.row {
    case 0 :
//      cell = tableView.dequeueReusableCell(withIdentifier: "test", for: indexPath)
      cell.textLabel?.text = "\(indexPath.row)"
      cell.backgroundColor = .red
      cell.contentView
      //cell.addSubview(InfiniteScrollView())
    case 1 :
      cell.textLabel?.text = "\(indexPath.row)"
      cell.backgroundColor = .orange
    case 2 :
      cell.textLabel?.text = "\(indexPath.row)"
      cell.backgroundColor = .yellow
    case 3 :
      cell.textLabel?.text = "\(indexPath.row)"
      cell.backgroundColor = .green
    case 4 :
      cell.textLabel?.text = "\(indexPath.row)"
      cell.backgroundColor = .blue
    case 5 :
      cell.textLabel?.text = "\(indexPath.row)"
      cell.backgroundColor = #colorLiteral(red: 0.7490196078, green: 0.3529411765, blue: 0.9490196078, alpha: 1)
    default:
      print("\(indexPath.row) ... default")
    }
    
    
    cell.textLabel?.text = "\(indexPath.row)"
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch indexPath.row {
    case 0 :
      print("\(indexPath.row)")
      return 100
    case 1 :
      print("\(indexPath.row)")
      return 200
    case 2 :
      print("\(indexPath.row)")
      return 300
    case 3 :
      print("\(indexPath.row)")
      return 400
    case 4 :
      print("\(indexPath.row)")
      return 300
    case 5 :
      print("\(indexPath.row)")
      return 200
    default:
      print("\(indexPath.row) ... default")
      return 100
    }
    
    // MARK: 기본 셀 높이
    //return 100
  }
  
}

extension HomeTableViewController: UITableViewDelegate {
  
}
