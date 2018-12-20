//
//  SearchNavicationViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 02/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class SearchNavicationViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  var searchValue: SearchList?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationItem.title = "상품 검색"
    tableView.delegate = self
    tableView.dataSource = self
    searchBar.delegate = self
    
    tableView.register(UINib(nibName: "ItemCell", bundle: nil),
                       forCellReuseIdentifier: "ItemCell")
  }
  
//  @objc func didTapRecommend(_ sender: UIButton) {
//    btnRecommend.to
//  }
//  @objc func didTapbtnNearest(_ sender: UIButton) {
//    btnRe
//    btnRecommend.setBackgroundColor(#colorLiteral(red: 0.1700494289, green: 0.7560927272, blue: 0.7329690456, alpha: 1), for: .normal)
//    btnRecommend.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
//    btnNearest.setBackgroundColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
//    btnNearest.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
//  }
}

//MARK: UISearchBar - 델리게이트
extension SearchNavicationViewController: UISearchBarDelegate {
  
  //MARK: UISearchBar - 입력 발생 시 취소 버튼 활성화 func
  func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    return true
  }
  
  //MARK: UISearchBar - 검색 버튼을 눌렀을 시 func
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    guard let inputKeyword = self.searchBar.text else { return }
    
    requestSearch.serchItem(keyword: inputKeyword) { (SearchList) in
      self.searchValue = SearchList
      self.tableView.rowHeight = 150
      self.tableView.reloadData()
    }
  }
  
}


extension SearchNavicationViewController: UITableViewDataSource {
  
  //MARK: 헤더에 뷰 추가하기
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    let view = UIView()
    let btnRecommend = UIButton(type: UIButton.ButtonType.system)
    let btnNearest = UIButton(type: UIButton.ButtonType.system)
    
    //부모 뷰에서 불러올때 프레임을 직접 잡아주지 않으면 0 0 으로 옴
    print("view size ",view.frame.size)
    
    btnRecommend.setTitle("추천 검색어", for: .normal)
    btnNearest.setTitle("최근 검색어", for: .normal)
    
    view.addSubview(btnRecommend)
    view.addSubview(btnNearest)
    
    //MARK: btn 배경색
    
    btnRecommend.setBackgroundColor(#colorLiteral(red: 0.1700494289, green: 0.7560927272, blue: 0.7329690456, alpha: 1), for: .normal)
    btnRecommend.setTitleColor(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1), for: .normal)
    btnNearest.setBackgroundColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .normal)
    btnNearest.setTitleColor(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), for: .normal)
    
    //MARK: btn 액션
//    btnRecommend.addTarget(self, action: #selector(didTapRecommend), for: .touchUpInside)
//    btnNearest.addTarget(self, action: #selector(didTapbtnNearest), for: .touchUpInside)
    
    //MARK: 코드 오토레이아웃 설정
    btnRecommend.translatesAutoresizingMaskIntoConstraints = false
    btnNearest.translatesAutoresizingMaskIntoConstraints = false
    
    //MARK: topAnchor, leadingAnchor +
    btnRecommend.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    btnRecommend.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
    btnRecommend.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    btnNearest.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
    btnNearest.leadingAnchor.constraint(equalTo: btnRecommend.trailingAnchor, constant: 0).isActive = true
    btnNearest.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
    btnNearest.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    
    
    //MARK: 기기의 넓이
    let originWidth = UIScreen.main.bounds.width
    //MARK: - 50은, 스페이스가 5개라 빼줌
    let objWidth = (originWidth - 10) / 2
    btnRecommend.widthAnchor.constraint(equalToConstant: objWidth).isActive = true
    btnNearest.widthAnchor.constraint(equalToConstant: objWidth).isActive = true
    
    return view
    
  }
  
  //MARK: Section의 높이
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    let tempCoutn = searchValue?.items.count ?? 0
    return tempCoutn
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let tempCompany = searchValue?.items[indexPath.row].company ?? "nil"
    let tempItemName = searchValue?.items[indexPath.row].itemName ?? "nil"
    let tempSalePrice = searchValue?.items[indexPath.row].salePrice ?? 0
    let tempUrl = searchValue?.items[indexPath.row].listThumbnail ?? "nil"
    
    cell.textLabel?.text = "[\(tempCompany)] " + tempItemName
    cell.detailTextLabel?.text = String(tempSalePrice)
    requestImage.imageData(url: tempUrl) { (Data) in
      cell.imageView?.image = UIImage(data: Data)
    }
    
    return cell
  }
  
}

extension SearchNavicationViewController: UITableViewDelegate {
}
