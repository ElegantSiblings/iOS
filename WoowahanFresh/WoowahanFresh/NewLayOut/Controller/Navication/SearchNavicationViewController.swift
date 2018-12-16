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
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    navigationItem.title = "상품 검색"
    tableView.delegate = self
    tableView.dataSource = self
    searchBar.delegate = self
    tableView.register(UITableView.self, forCellReuseIdentifier: "Cell")
    }
}

extension SearchNavicationViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 3
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    cell.textLabel?.text = "123"//"\(indexPath.row)"
    
    return cell
  }
  
}

extension SearchNavicationViewController: UITableViewDelegate {
}

extension SearchNavicationViewController: UISearchBarDelegate {
}
/*
extension SearchNavicationViewController: UISearchResultsUpdating {
  func updateSearchResults(for searchController: UISearchController) {
    print("1111")
  }
  
  
}

extension SearchNavicationViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    
    return cell
  }
  
  
}

extension SearchNavicationViewController: UITableViewDelegate {
  
}
*/
