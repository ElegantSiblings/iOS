//
//  CategoryViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 27/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var items = [String]()
  
  var homeViewTop: HomeViewTop!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    autolayoutViewTop()
    
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
//    tableView.backgroundColor = .green
    
    items = [ "전체보기", "무침", "나물", "볶음", "조림", "젓갈・장・소스", "세트"]
    
    
  }
  
  // 버튼 이벤트
  @IBAction func btnSideDish(_ sender: Any) {
    items = [ "전체보기", "무침", "나물", "볶음", "조림", "젓갈・장・소스", "세트"]
    tableView.reloadData()
  }
  
  @IBAction func btnMainDish(_ sender: Any) {
    items = [ "전체보기", "고기반찬", "해산물 반찬", "분식", "튀김", "전・계란반찬", "세트"]
    tableView.reloadData()
  }
  
  @IBAction func btnSoup(_ sender: Any) {
    items = [ "국", "찌개", "탕", "전골", "세트"]
    tableView.reloadData()
  }
  
  @IBAction func btnKidDish(_ sender: Any) {
    items = [ "전체보기", "메인반찬", "국・찌개", "간식・음료" ]
    tableView.reloadData()
  }
  
  @IBAction func btnMeat(_ sender: Any) {
    items = [ "전체보기", "소고기", "돼지고기", "양념구이", "소스&곁들임찬", "채소", "마무리식사"]
    tableView.reloadData()
  }
  
  @IBAction func btnKimchi(_ sender: Any) {
    items = [ "전체보기", "김치", "장아찌・피클" ]
    tableView.reloadData()
  }
  
  @IBAction func btnGlobal(_ sender: Any) {
    items = [ "전체보기", "양식", "아시아식"]
    tableView.reloadData()
  }
  
  @IBAction func btnRice(_ sender: Any) {
    items = [ "전체보기", "밥", "죽", "면"]
    tableView.reloadData()
  }
  
  @IBAction func btnSalad(_ sender: Any) {
    items = [ "전체보기", "샐러드", "샌드위치"]
    tableView.reloadData()
  }
  
  @IBAction func btnSnack(_ sender: Any) {
    items = [ "전체보기", "베이커리", "과일", "주스・음료", "스무디", "유제품・커피", "기타간식"]
    tableView.reloadData()
  }
  
  @IBAction func btnRegularDiet(_ sender: Any) {
    items = [ "전체보기", "1~2인", "3~4인", "아이반찬"]
    tableView.reloadData()
  }
  
  @IBAction func btnBrand(_ sender: Any) {
    items = [ "전체보기", "반찬가게", "반찬 장인", "셰프의 요리", "전국맛집", "키즈관"]
    tableView.reloadData()
  }
  
  
  
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
    
    print(homeViewTop.frame)
    
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

extension CategoryViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    print(section)
    return items.count
    
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    print(indexPath.row)
    
    //    cell.textLabel!.text = "Cell \(indexPath.section), \(indexPath.row)"
    cell.textLabel!.text = items[indexPath.row]
    
    return cell
  }
  
  
}

extension CategoryViewController: UITableViewDelegate {
  
}

