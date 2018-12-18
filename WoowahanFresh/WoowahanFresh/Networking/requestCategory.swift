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
    //    let url = "https://api.elegantsiblings.xyz/categories/"
    let url = "https://api.elegantsiblings.xyz/new/categories/"
    let requestUrl = url + pk
    
    //?category_pk=2&is_ios=true
    let params: Parameters = [
      "is_ios" : "true"
    ]
    
    Alamofire.request(requestUrl, method: .get, parameters: params)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let value):
          do {
            //print(value)
            listItem = try JSONDecoder().decode(ItemList.self, from: value)
            handler(listItem!)
          } catch {
            print(error)
          }
        case .failure(let error):
          print(error)
        }
    }
  }
  
}
