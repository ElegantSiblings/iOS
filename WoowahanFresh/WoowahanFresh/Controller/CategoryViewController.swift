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
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    
    items = [ "전체보기", "무침", "나물", "볶음", "조림", "젓갈・장・소스", "세트"]
    
    homeViewTop =  HomeViewTop(frame: CGRect.zero)
    view.addSubview(homeViewTop)
    homeViewTop.translatesAutoresizingMaskIntoConstraints = false
    homeViewTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    
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
  
  
  // 버튼 이벤트 끝
  
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

