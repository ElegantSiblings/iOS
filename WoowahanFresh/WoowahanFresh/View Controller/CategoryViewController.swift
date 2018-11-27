//
//  CategoryViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 27/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

  @IBOutlet weak var TableView: UITableView!
  
  private var items = [ 1,2,3,4,5,6,7,8,9,10 ]
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func btnSideDish(_ sender: Any) {
    items = [ 1,2,3,4 ]
  }
  

}

extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    print(indexPath.row)
    return cell
  }
  
  
}

extension CategoryViewController: UITableViewDelegate {
  
}


//extension CategoryViewController: UITableViewDataSource {
//  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    return items.count
//  }
//
//  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//
////    cell.textLabel?.text = "1"
//
//    return cell
//  }
//
//
//}
//
//extension CategoryViewController: UITableViewDelegate {
//
//
//}

