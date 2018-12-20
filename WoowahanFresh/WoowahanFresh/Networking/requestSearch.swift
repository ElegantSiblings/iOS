//
//  requestSearch.swift
//  WoowahanFresh
//
//  Created by qbbang on 16/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import Alamofire

struct requestSearch {
  
  //MARK: 상품 상세정보
  static var serchItem: SearchList?
  
  static func serchItem(keyword: String, handler: @escaping (SearchList) -> Void) {
   
    let url = "https://api.elegantsiblings.xyz/new/search/"
    let params: Parameters = [
      "search_str": keyword,
      "is_ios": true
    ]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseData { response in
//        print(response.response?.statusCode)
        switch response.result {
        case .success(let value):
          do {
          serchItem = try JSONDecoder().decode(SearchList.self, from: value)
          handler(serchItem!)
          } catch {
            print(error)
          }
        case .failure(let error):
          print(error)
        }
    }
  }
}
