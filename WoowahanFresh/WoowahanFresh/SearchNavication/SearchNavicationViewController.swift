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
  var searchValue = SearchResult()
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    navigationItem.title = "상품 검색"
    tableView.rowHeight = 300
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
    requestSearch.serchItem(keyword: inputKeyword) { (SearchResult) in
      self.searchValue = SearchResult
      self.tableView.reloadData()
    }
  }
  
}


extension SearchNavicationViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return searchValue.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    cell.textLabel.text = "111"
    cell.textLabel?.text = "[\(searchValue[indexPath.row].company)] "
    cell.imageView?.image = UIImage(named: "btnKidDish")
    
   
    
    return cell
  }
  
}

extension SearchNavicationViewController: UITableViewDelegate {
}

