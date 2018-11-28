//
//  MasterViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 27/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
  
  var homeViewTop: HomeViewTop!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    homeViewTop =  HomeViewTop(frame: CGRect(x: 0, y: 50, width: 375, height: 42))
    view.addSubview(homeViewTop)
    
    // 기본값 false, ture이면, 부모뷰 밖이라도 보여줌.
    homeViewTop.clipsToBounds = true
    
    // MARK: Top Button Events
    homeViewTop.btnHome.addTarget(self, action: #selector(btnHomeDidTap), for: .touchUpInside)
    homeViewTop.btnSearch.addTarget(self, action: #selector(btnSearchDidTap), for: .touchUpInside)
    homeViewTop.btnShopping.addTarget(self, action: #selector(btnShoppingDidTap), for: .touchUpInside)
    
    homeViewTop.translatesAutoresizingMaskIntoConstraints = false
//    homeViewTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
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
