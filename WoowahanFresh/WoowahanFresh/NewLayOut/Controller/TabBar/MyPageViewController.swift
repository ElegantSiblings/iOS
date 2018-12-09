//
//  MyPageViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 30/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
  }
}

extension MyPageViewController: UITableViewDataSource {
  
  //MARK: Section 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    //MARK: section 1 - Cell 2, 로그인, 포인트
    //      section 2 - Cell 2, 주문내역, 찜 상품
    //      section 3 - if 로그인 - Cell 4,
    //                - if 로그아웃 - Cell 5, + 로그아웃
    //      section 4 - Cell 2, 새벽배송, 배민찬 고객센터
    return 4
  }
  
  //MARK: Cell의 갯수
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    if section == 0 {
      return 2
    } else if section == 1 {
      return 2
    } else if section == 2 {
      return 4
    } else if section == 3 {
      return 2
    } else {
      return 0
    }
  }
  
  //MARK: Cell
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
      switch indexPath.row {
        
      case 0 :
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "로그인 해주세요"
        return cell
        
      case 1 :
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "포인트 / 쿠폰함 / 회원등급"
        return cell
        
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
      }
    } else if indexPath.section == 1 {
      switch indexPath.row {
      case 0 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "주문내역"
        return cell
        
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "찜 한 상품"
        return cell
        
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
        
      }
    } else if indexPath.section == 2 {
      switch indexPath.row {
      case 0 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "공지사항"
        
        return cell
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "자주하는 질문"
        return cell
        
      case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "이벤트 게시판"
        return cell
        
      case 3:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "1:1 문의"
        return cell
        
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
      }
    } else if indexPath.section == 3 {
      switch indexPath.row {
      case 0:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "새벽배송 / 정기배송 / 단체주문"
        return cell
        
      case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "배민찬 고객센터"
        return cell
        
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
      }
    } else {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      
      return cell
    }
    
  }
}

extension MyPageViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    print("\(indexPath.section) + \(indexPath.row)")
    
    if indexPath.section == 0 ||
      indexPath.section == 1 {
      
      let storyboard = UIStoryboard(name: "Login", bundle: nil)
      let masterVC = storyboard.instantiateInitialViewController()!
      //let nextVC = storyboard.instantiateViewController(withIdentifier: "DishTableViewController") as! DishTableViewController
      
      self.present(masterVC, animated: true, completion: {
        //      DispatchQueue.main.async {
        //        nextVC.testString = "밑반찬"
        //        nextVC.navigationItem.title = "밑반찬"
      })
      
    }
    
    
    
    /*
    let storyboard = UIStoryboard(name: "Item", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    //let nextVC = storyboard.instantiateViewController(withIdentifier: "DishTableViewController") as! DishTableViewController
    
    self.present(masterVC, animated: true, completion: {
      //      DispatchQueue.main.async {
      //        nextVC.testString = "밑반찬"
      //        nextVC.navigationItem.title = "밑반찬"
    })
    */
  }
}
