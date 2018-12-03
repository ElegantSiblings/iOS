//
//  HomeTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 29/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

var sectionData = ["", "이럴 땐 이 상품", "이 시간 베스트", "배민찬 추천", "이런 것도 있어요",
                   "오늘의 반찬가게", "후기로 검증된 인기반찬", "곧 할인 종료!"]

class HomeTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    let nibInfi = UINib(nibName: "InfiniteScrollViewCell", bundle: nil)
    tableView.register(nibInfi, forCellReuseIdentifier: "InfiniteScrollViewCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
}

extension HomeTableViewController: UITableViewDataSource {
  
  //MARK: Section 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    return HomeSection().list.count
  }
  
  //MARK: Section의 이름
  func tableView(_ tableView: UITableView,
                 titleForHeaderInSection section: Int) -> String? {
    return HomeSection().list[section]
  }
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //MARK:
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InfiniteScrollViewCell", for: indexPath) as! InfiniteScrollViewCell
      cell.textLabel?.text = "\(indexPath.section) & \(indexPath.row)"
      return cell
      
    } else if indexPath.section == 1 {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      cell.textLabel?.text = "\(indexPath.section) & \(indexPath.row)"
      
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      return cell
    }
    
    
    /*
     if indexPath.section == 1{
     let cell = tableView.dequeueReusableCell(withIdentifier: "InfiniteScrollViewCell", for: indexPath) as! InfiniteScrollViewCell
     
     return cell
     } else{
     
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
     
     
     cell.textLabel?.text = "\(indexPath.row)"
     
     return cell
     }
     switch indexPath.row {
     case 0 :
     let cell = tableView.dequeueReusableCell(withIdentifier: "InfiniteScrollViewCell", for: indexPath) as! InfiniteScrollViewCell
     
     return cell
     case 1 :
     break
     case 2 :
     break
     case 3 :
     break
     case 4 :
     break
     case 5 :
     break
     default:
     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
     
     
     cell.textLabel?.text = "\(indexPath.row)"
     
     return cell
     }
     }
     */
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch indexPath.section {
    case 0 :
      print(self.view.frame.size)
      return 400
    default:
      return 100
    }
    
  }
}

extension HomeTableViewController: UITableViewDelegate {
  
}
