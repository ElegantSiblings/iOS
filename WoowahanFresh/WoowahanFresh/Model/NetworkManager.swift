//
//  NetworkManager.swift
//  WoowahanFresh
//
//  Created by qbbang on 05/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import Alamofire

class NetworkManager {
  
  //weak var delegate: NetworkManagerDelegate?
  
  func apiFetch(_ url : String ,
                completion: @escaping ([Any]) -> Void) {
    
    //    let url = API.Auth.categories
    
    //MARK: 이미지 데이터 요청
    Alamofire.request(url, method: .get)
      .validate()
      .responseData { (response) in
        print(Alamofire.request(url, method: .get))
        switch response.result {
        case .success(let value):
          
          completion([value])
          
        case .failure(let error):
          print("error = ", error.localizedDescription)
        }
    }
  }
  

}



//MARK :비동기 처리

/*
 import Alamofire
 
 final class TestViewController: UIViewController {
 
 var data: [String] = []
 var tableView: UITableView?
 
 
 func fetch() {
 
 
 }
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 let manager = NetworkManager()
 manager.delegate = self
 manager.fetch(completion: { listing -> Void in
 self.data = listing
 self.tableView.reloadData()
 })
 }
 }
 
 extension TestViewController: NetworkManagerDelegate {
 func action(model: Listing) {
 self.data = model
 self.tableView?.reloadData()
 }
 }
 
 extension TestViewController: UITableViewDataSource {
 func numberOfSections(in tableView: UITableView) -> Int {
 return 0
 }
 
 }
 
 class NetworkManager {
 
 weak var delegate: NetworkManagerDelegate?
 
 func fetch(completion: @escaping (Listing) -> Void) {
 Alamofire
 .request(<#T##url: URLConvertible##URLConvertible#>)
 .response { response in
 let listing =
 completion(listing)
 delegate?.action(model: listing)
 }
 }
 }
 
 protocol NetworkManagerDelegate: class {
 
 func action(model: Listing)
 }
 
 */
