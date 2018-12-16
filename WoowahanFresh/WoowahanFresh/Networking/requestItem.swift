//
//  requestItem.swift
//  WoowahanFresh
//
//  Created by qbbang on 12/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import Alamofire

struct requestItem {
  
  //MARK: 상품 상세정보
  static var detailItem: ItemDetails?
  
  static func detailInfo(pk: String, handler: @escaping (ItemDetails) -> Void) {
    let url = "https://api.elegantsiblings.xyz/item/"
    let params: Parameters = [
      "item_pk": pk
      //"is_ios" : "true"
    ]
    
    Alamofire.request(url, method: .get, parameters: params)
      .validate()
      .responseData { response in
        switch response.result {
        case .success(let value):
          
          do {
          detailItem = try JSONDecoder().decode(ItemDetails.self, from: value)
          handler(detailItem!)
          } catch {
            print(error)
          }
          
        case .failure(let error):
          print(error)
        }
    }
  }
}
