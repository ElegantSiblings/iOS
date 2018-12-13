//
//  requestCategory.swift
//  WoowahanFresh
//
//  Created by qbbang on 12/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import Alamofire

struct requestCategory {
  
  static var listItem: ItemList?
  static func listInfo(
    pk: String,
    handler: @escaping (ItemList) -> Void
    ) {
    let url = "https://api.elegantsiblings.xyz/categories/"
    
    //?category_pk=2&is_ios=true
    let params: Parameters = [
      "category_pk": pk,
      //"is_ios" : "true"
    ]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let value):
          listItem = try! JSONDecoder().decode(ItemList.self, from: value)
          handler(listItem!)
        case .failure(let error):
          print(error)
        }
    }
  }
  
}
