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
  static func addItem(item_pk: String) {
    //handler: @escaping () -> Void {
    let url = "https://api.elegantsiblings.xyz/new/cart/"
    
    let header: HTTPHeaders = [
      "Authorization": "Token \(SingleUserInfo.sharedInstance.token)"
    ]
    
    print("itempk ==== ",item_pk)
    let params: Parameters = [
      "item": Int(item_pk)!,
      "amount": 1
    ]
    
    Alamofire.request(url, method: .post,
                      parameters: params,
                      encoding: JSONEncoding.default,
                      headers: header)
      .validate()
      .responseData { response in
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success( _):
            print("=========")
          case .failure(let error):
            print(error)
          }
        } else if response.response?.statusCode == 400 {
          guard let code = response.response?.statusCode else { return }
          print(code)
          
          //          MARK: 응답 data 인코딩
          let dataa = response.data
          let tempp = String(data: dataa!, encoding: .utf8)
          print("400 메시지", tempp ?? "nil")
          
        } else {
          guard let code = response.response?.statusCode else { return }
          
          guard let requestData = response.request?.httpBody else { return }
          let printData = String(data: requestData, encoding: .utf8)
          print("카드 요청 바디 :", printData ?? "nil")
          print(code)
        }
    }
  }
  
  //MARK: 장바구니 조회
  static func hitsItem(handler: @escaping (ShoppingList) -> Void) {
    let url = "https://api.elegantsiblings.xyz/new/cart/"
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
              print("Error(장바구니 조회): ",error)
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

