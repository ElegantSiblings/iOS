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
    print("====================")
    print("DishCategoryTableViewController")
    print("====================")
    
    //MARK: 테이블뷰 설정
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    tableView.register(UINib(nibName: "InfiniteScrollViewCell", bundle: nil), forCellReuseIdentifier: "InfiniteScrollViewCell")
    tableView.register(UINib(nibName: "CategoriesHomeCell", bundle: nil), forCellReuseIdentifier: "CategoriesHomeCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
  }
  
  //MARK: DishCategoryView에서 HomeTableView로 돌아옴
  @IBAction func unwindToHomeTable(_ unwindSegue: UIStoryboardSegue) {
    print("DishCategoryView에서 HomeTableView로 돌아옴")
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
      //cell.textLabel?.text = "\(indexPath.section) & \(indexPath.row)"
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
    //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
    let storyboard = UIStoryboard(name: "DishCategoryList", bundle: nil)
    let DishVC = storyboard.instantiateViewController(withIdentifier: "DishCategoryTableViewController") as! DishCategoryTableViewController
    
    // 밑반찬 - 전체보기
    DishVC.requestPK = "1"
    navigationController?.pushViewController(DishVC, animated: true)
  }
  
  func DidTabMainDish() {
    //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
    let storyboard = UIStoryboard(name: "DishCategoryList", bundle: nil)
    let DishVC = storyboard.instantiateViewController(withIdentifier: "DishCategoryTableViewController") as! DishCategoryTableViewController
    
    // 메인반찬 - 전체보기
    // 8, 9, 10 안됨
    DishVC.requestPK = "8"
    navigationController?.pushViewController(DishVC, animated: true)
  }
  
  func DidTabSoup() {
    //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
    let storyboard = UIStoryboard(name: "DishCategoryList", bundle: nil)
    let DishVC = storyboard.instantiateViewController(withIdentifier: "DishCategoryTableViewController") as! DishCategoryTableViewController
    
    // 국찌개탕 - 전체보기
    DishVC.requestPK = "15"
    navigationController?.pushViewController(DishVC, animated: true)
  }
  
  func DidTabKids() {
    //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
    let storyboard = UIStoryboard(name: "DishCategoryList", bundle: nil)
    let DishVC = storyboard.instantiateViewController(withIdentifier: "DishCategoryTableViewController") as! DishCategoryTableViewController
    
    // 아이반찬 - 전체보기
    DishVC.requestPK = "21"
    navigationController?.pushViewController(DishVC, animated: true)
  }
  
  func DidTabRice() {
    //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
    let storyboard = UIStoryboard(name: "DishCategoryList", bundle: nil)
    let DishVC = storyboard.instantiateViewController(withIdentifier: "DishCategoryTableViewController") as! DishCategoryTableViewController
    
    // 밥죽면 - 전체보기
    DishVC.requestPK = "39"
    navigationController?.pushViewController(DishVC, animated: true)
  }
  
  
}
