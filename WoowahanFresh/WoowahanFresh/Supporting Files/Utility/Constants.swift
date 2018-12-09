//
//  Constants.swift
//  WoowahanFresh
//
//  Created by qbbang on 05/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation


enum API {
  static let baseURL = "http://wps-docker-master.ap-northeast-2.elasticbeanstalk.com/api/"
  
  enum Auth {
    //MARK: 전체 카테고리 61개
    //MARK: ?category_pk = 1 하면 전체카테고리 1의 세부 카테고리
    static let categories = API.baseURL + "categories/"
    //MARK: 상품 세부정보
    static let Ite = API.baseURL + "item/"
  }
}

