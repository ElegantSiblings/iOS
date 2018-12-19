//
//  requestImage.swift
//  WoowahanFresh
//
//  Created by qbbang on 17/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import Alamofire

struct requestImage {
  //MARK: 이미지 데이터 요청
  static func imageData(url: String, handler: @escaping (Data) -> Void) {
    Alamofire.request(url, method: .get)
      .validate()
      .responseData { (response) in
        switch response.result {
        case .success(let value):
          handler(value)
        case .failure(let error):
          print("error = ", error.localizedDescription)
        }
        
    }
  }
}
