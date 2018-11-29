//
//  MasterViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 27/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class StatusTableViewCell: UITableViewCell {
  
  @IBOutlet weak var statusLabel: UILabel!
  @IBOutlet weak var usernameLabel: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
    statusLabel.font = .boldSystemFont(ofSize: 16)
  }
}

class HomeViewController: UIViewController {
  
  var homeViewTop: HomeViewTop!
  var homeContentsView: HomeContentsView!
  
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    
    autolayoutViewTop()
    // 기본값 false, ture이면, 부모뷰 밖이라도 보여줌.
    //homeViewTop.clipsToBounds = true
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    
  }
  
  // 밑반찬 테스트
  @IBAction func btnTestJson(_ sender: Any) {
    let storyboard = UIStoryboard(name: "test", bundle: nil)
    let masterVC = storyboard.instantiateInitialViewController()!
    
    self.present(masterVC, animated: false, completion: {
      //      print(self.testArray[3].pk)
    })
  }
  
  // 테스트 끝
  
  func autolayoutViewTop() {
    
    // MARK: homeViewTop addSubview
    homeViewTop = HomeViewTop(frame: CGRect.zero)
    view.addSubview(homeViewTop)
    
    // MARK: homeViewTop 오토레이아웃
    homeViewTop.translatesAutoresizingMaskIntoConstraints = false
    homeViewTop.topAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    homeViewTop.leadingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
    homeViewTop.trailingAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
    homeViewTop.bottomAnchor.constraint(
      equalTo: view.safeAreaLayoutGuide.topAnchor, constant: view.frame.height / 19).isActive = true
    
    // MARK: Top Button Events
    homeViewTop.btnHome.addTarget(self, action: #selector(btnHomeDidTap), for: .touchUpInside)
    homeViewTop.btnSearch.addTarget(self, action: #selector(btnSearchDidTap), for: .touchUpInside)
    homeViewTop.btnShopping.addTarget(self, action: #selector(btnShoppingDidTap), for: .touchUpInside)
    
  }
  
  
  // TODO: addTaget으로 해도 되지만, 델리게이트 패턴 써볼것
  @objc func btnHomeDidTap() {
    print(111)
    let storyboard = UIStoryboard(name: "Master", bundle: nil)
    let homeVC = storyboard.instantiateInitialViewController()!
    super.present(homeVC, animated: false, completion: {
      print("present -> HomeView")
    })
  }
  
  @objc func btnSearchDidTap() {
    print(111)
    let storyboard = UIStoryboard(name: "Search", bundle: nil)
    let searchVC = storyboard.instantiateInitialViewController()!
    super.present(searchVC, animated: true, completion: {
      print("present -> SearchView")
    })
  }
  
  @objc func btnShoppingDidTap() {
    print(111)
    let storyboard = UIStoryboard(name: "ShoppingList", bundle: nil)
    let shoppingListVC = storyboard.instantiateInitialViewController()!
    super.present(shoppingListVC, animated: true, completion: {
      print("present -> ShoppingListView")
    })
  }
  
}



extension HomeViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(section)
    return 10
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    print(indexPath.row)
    
    //    //    cell.textLabel!.text = "Cell \(indexPath.section), \(indexPath.row)"
    //    cell.textLabel!.text = "test"
    //
    //    return cell
    
    return cell
  }
  
  
}

extension HomeViewController: UITableViewDelegate {
  
}

