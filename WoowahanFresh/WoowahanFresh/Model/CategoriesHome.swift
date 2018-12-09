//
//  CategoriesHome.swift
//  WoowahanFresh
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation

typealias CategoriesHome = [CategoryHome]

struct CategoryHome: Codable {
  let pk: Int
  let mainCategory, subCategory: String
  let photo: String
  
  enum CodingKeys: String, CodingKey {
    case pk
    case mainCategory = "main_category"
    case subCategory = "sub_category"
    case photo
  }
}
