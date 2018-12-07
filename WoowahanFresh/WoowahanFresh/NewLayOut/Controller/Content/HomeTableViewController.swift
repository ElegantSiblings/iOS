//
//  HomeTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 29/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

var sectionData = ["", "", "이럴 땐 이 상품", "이 시간 베스트", "배민찬 추천", "이런 것도 있어요",
                   "오늘의 반찬가게", "후기로 검증된 인기반찬", "곧 할인 종료!"]

class HomeTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    tableView.register(UINib(nibName: "InfiniteScrollViewCell", bundle: nil), forCellReuseIdentifier: "InfiniteScrollViewCell")
    tableView.register(UINib(nibName: "CategoriesHomeCell", bundle: nil), forCellReuseIdentifier: "CategoriesHomeCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    tableView.reloadData()
  }
  
  func pageChange() {
    print("111")
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
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesHomeCell", for: indexPath) as! CategoriesHomeCell
      
      cell.delegate = self
      
      return cell
      
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      return cell
    }
    
  }
  
  //MARK: taview
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch indexPath.section {
    case 0 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 3 )
      print(size)
      return size
      
    case 1 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 1 )
      print(size)
      return size
      
    default:
      return 100
    }
    
  }
}

extension HomeTableViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    print(indexPath.section)
    
  }
  
}

extension HomeTableViewController: CategoriesHomeCellDelegate {
  func DidTabSubDish() {
    
    let storyboard = UIStoryboard(name: "SubDishList", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    //let nextVC = storyboard.instantiateViewController(withIdentifier: "DishTableViewController") as! DishTableViewController
    
    self.present(masterVC, animated: true, completion: {
//      DispatchQueue.main.async {
//        nextVC.testString = "밑반찬"
//        nextVC.navigationItem.title = "밑반찬"
    })
  }
  
  func DidTabMainDish() {
    let storyboard = UIStoryboard(name: "SubDishList", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    
    self.present(masterVC, animated: true, completion: {
      masterVC.navigationItem.title = " 111 "
    })
  }
  
  func DidTabSoup() {
    let storyboard = UIStoryboard(name: "DishList", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    
    self.present(masterVC, animated: true, completion: {
      masterVC.navigationItem.title = " 111 "
    })
  }
  
  func DidTabKids() {
    let storyboard = UIStoryboard(name: "DishList", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    
    self.present(masterVC, animated: true, completion: {
      masterVC.navigationItem.title = " 111 "
    })
  }
  
  func DidTabRice() {
    let storyboard = UIStoryboard(name: "DishList", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    
    self.present(masterVC, animated: true, completion: {
      masterVC.navigationItem.title = " 111 "
    })
  }
  
  
}
