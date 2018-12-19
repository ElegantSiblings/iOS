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
    tableView.rowHeight = 150
    tableView.delegate = self
    tableView.dataSource = self
    searchBar.delegate = self
    
    tableView.register(UINib(nibName: "ItemCell", bundle: nil),
                       forCellReuseIdentifier: "ItemCell")
    }
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
      self.tableView.reloadData()
    }
  }
  
}


extension SearchNavicationViewController: UITableViewDataSource {
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

