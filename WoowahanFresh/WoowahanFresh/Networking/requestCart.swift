//
//  requestCart.swift
//  WoowahanFresh
//
//  Created by qbbang on 12/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import Alamofire

struct requestCart {
  
  
  static var shoppingList: ShoppingList?
  
  //MARK: 장바구니 담기 요청
  static func addItem(item_pk: Int) {
    //handler: @escaping () -> Void {
    let url = "https://api.elegantsiblings.xyz/cart/"
    
    let params: Parameters = [
      "item_pk": item_pk,
      "amount": 1
    ]
    
    let header: HTTPHeaders = [
      "Authorization": "Token \(SingleUserInfo.sharedInstance.token)"
    ]
    //조회는 get
    //아이템 추가는 post
    
    Alamofire.request(url, method: .post,
                      parameters: params,
                      headers: header)
      .validate()
      .responseJSON { response in
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success( _):
            print("=========")
          //            print(value)
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
  
  //MARK: 장바구니 조회
  static func hitsItem(handler: @escaping (ShoppingList) -> Void) {
    let url = "https://api.elegantsiblings.xyz/cart/"
    
    let header: HTTPHeaders = [
      "Authorization": "Token \(SingleUserInfo.sharedInstance.token)"
    ]
    
    Alamofire.request(url, method: .get,
                      headers: header)
      .validate()
      .responseData { response in
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success(let value):
            do {
              shoppingList = try JSONDecoder().decode(ShoppingList.self, from: value)
              handler(shoppingList!)
            } catch {
              print(error)
            }
            
          case .failure(let error):
            print(error)
          }
        } else if response.response?.statusCode == 401 {
          print("토큰이 유효하지 않음")
        } else {
          guard let code = response.response?.statusCode else { return }
          
          print("그 외 상태 코드 : ",code)
        }
    }
  }
}

