//
//  requestOrder.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import Alamofire

struct requestOrder {
  
  
  static var orderList: OrderList?
  
  static func isPayment(address: String, date: String,
                        price: Int, orderItemList: [Int],
                        handler: @escaping (OrderList) -> Void) {
    let url = "https://api.elegantsiblings.xyz/new/order/"
    
    let params: Parameters = [
      "address": address,
      "delivery_date": date,
      "total_price": price,
      "cart_item_pk": orderItemList
    ]
    
    print("params : ", params)
    
    let header: HTTPHeaders = [
      "Authorization": "Token \(SingleUserInfo.sharedInstance.token)"
    ]
    //조회는 get
    //아이템 추가는 post
    
    Alamofire.request(url, method: .post,
                      parameters: params,
                      headers: header)
      .validate()
      .responseData { response in
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success(let value):
            do {
              orderList = try JSONDecoder().decode(OrderList.self, from: value)
              handler(orderList!)
            } catch {
              print(error)
            }
          case .failure(let error):
            print(error)
          }
        } else if response.response?.statusCode == 400 {
          guard let code = response.response?.statusCode else { return }
          print(code)
          
        } else {
          guard let code = response.response?.statusCode else { return }
          
          print(code)
        }
    }
  }
}

