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
  
  
  static var orderResult: OrderResult?
  static var orderCheck: OrderCheck?
  
  static func isPayment(address: String, date: String,
                        price: Int, orderItemList: [Int],
                        handler: @escaping (OrderResult) -> Void) {
    let url = "https://api.elegantsiblings.xyz/new/order/"
    
    let params: Parameters = [
      "address": address,
      "delivery_date": date,
      "total_price": price,
      "cart_item_pk": orderItemList
    ]
    
    let header: HTTPHeaders = [
      "Authorization": "Token \(SingleUserInfo.sharedInstance.token)"
    ]
    
    Alamofire.request(url, method: .post,
                      parameters: params,
                      encoding: JSONEncoding.default,
                      headers: header)
      .validate()
      .responseData { response in
        let requestData = response.request?.httpBody
        let printData = String(data: requestData!, encoding: .utf8)
        print("요청 바디 :", printData ?? "nil")
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success(let value):
            print("성공")
            print(value)
            do {
              orderResult = try JSONDecoder().decode(OrderResult.self, from: value)
              handler(orderResult!)
            } catch {
              print("Error :", error)
            }
          case .failure(let error):
            print(error)
          }
        } else if response.response?.statusCode == 400 {
          guard let code = response.response?.statusCode else { return }
          print(code)
//          MARK: 응답 data 인코딩
//          let dataa = response.data
//          let tempp = String(data: dataa!, encoding: .utf8)
//          print("error 메시지", tempp ?? "nil")
        } else {
          guard let code = response.response?.statusCode else { return }
          print(code)
        }
    }
  }
  
  
  static func isCheck(orderPk: String,
                      handler: @escaping (OrderCheck) -> Void) {
    let url = "https://api.elegantsiblings.xyz/new/order/"
    let requestUrl = url + orderPk + "/"
    
    let header: HTTPHeaders = [
      "Authorization": "Token \(SingleUserInfo.sharedInstance.token)"
    ]
    
    Alamofire.request(requestUrl, method: .get,
                      encoding: JSONEncoding.default,
                      headers: header)
      .validate()
      .responseData { response in
        if response.response?.statusCode == 200 {
          switch response.result {
          case .success(let value):
            print("성공")
            do {
              orderCheck = try JSONDecoder().decode(OrderCheck.self, from: value)
              handler(orderCheck!)
            } catch {
              print("Error :", error)
            }
          case .failure(let error):
            print(error)
          }
        } else if response.response?.statusCode == 400 {
          guard let code = response.response?.statusCode else { return }
          print(code)
          //          MARK: 응답 data 인코딩
          //          let dataa = response.data
          //          let tempp = String(data: dataa!, encoding: .utf8)
          //          print("error 메시지", tempp ?? "nil")
        } else {
          guard let code = response.response?.statusCode else { return }
          print(code)
        }
    }
  }
}

