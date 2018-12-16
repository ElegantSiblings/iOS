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
  static var serchItem: SearchResult?
  
  static func serchItem(keyword: String, handler: @escaping (SearchResult) -> Void) {
   
    let url = "https://api.elegantsiblings.xyz/search/"
    let params: Parameters = [
      "search_str": keyword
    ]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let value):
          do {
          serchItem = try JSONDecoder().decode(SearchResult.self, from: value)
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
