//
//  Codable.swift
//  WoowahanFresh
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//
import Foundation

typealias ModelCategory = [ModelCategoryElement]

struct ModelCategoryElement: Codable {
  let categoryPk, mainCategory, subCategory: String
  let photo: String
  
  enum CodingKeys: String, CodingKey {
    case categoryPk = "category_pk"
    case mainCategory = "main_category"
    case subCategory = "sub_category"
    case photo
  }
}
