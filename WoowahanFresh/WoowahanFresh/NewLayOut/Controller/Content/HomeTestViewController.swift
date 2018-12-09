//
//  HomeTestViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//
/*
import UIKit
import Alamofire

class HomeTestViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("Homtest")
    
    tableView.delegate = self
    tableView.dataSource = self
    //tableView.separatorStyle = .none
    
    
    tableView.register(UINib(nibName: "InfiniteScrollViewCell", bundle: nil), forCellReuseIdentifier: "InfiniteScrollViewCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    let manger = NetworkManager()
    manger.apiFetch(API.Auth.Ite) { (ModelCategory) in
      print("=======")
      print(ModelCategory.count)
      
    }
  }
////////
  /*
  private func requestService(
    url: String,
    username: String,
    completionHandler: @escaping (Item) -> ()
    ) {
    let params: Parameters = [
      "item_pk": username
    ]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseJSON { response in
        switch response.result {
        case .success(let value):
          do {
            let item = try value.decode(Item.self)
            completionHandler(.success(item))
          } catch {
            completionHandler(.error(error))
          }
        case .failure(let error):
          completionHandler(.error(error))
        }
    }
  }
}
  
////////
}
 */

extension HomeTestViewController: UITableViewDelegate {
  
}

extension HomeTestViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //MARK: 카테고리로 들어온 배열의 개수? 61
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.row == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "InfiniteScrollViewCell", for: indexPath) as! InfiniteScrollViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      return cell
      
    }
    //    cell.testImage = UIImage(data: arrayOfTestData[indexPath.row].photo)
    //    cell.textLabel?.text = " \(arrayOfTestData[indexPath.row].categoryPk) \(arrayOfTestData[indexPath.row].mainCategory) \(arrayOfTestData[indexPath.row].subCategory)"
    //    cell.textLabel?.text = " \(arrayOfTestData[indexPath.row].categoryPk) \(arrayOfTestData[indexPath.row].mainCategory) \(arrayOfTestData[indexPath.row].subCategory)"
    
    //
    //    print("셀셀 : ", arrayOfTestData.count)
    //    cell.textLabel?.text = "\(indexPath.row)"
    //
    //
    //    return cell
  }
  
  //MARK: taview
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch indexPath.row {
    case 0 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 3 )
      print(size)
      return size
      
    default:
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 1 )
      print(size)
      return size
    }
    
  }
  
}
*/
