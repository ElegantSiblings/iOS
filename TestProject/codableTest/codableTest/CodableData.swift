//
//  CodableData.swift
//  codableTest
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation

struct Welcome: Codable {
  let categoryImg: String
  let subCategories: [SubCategory]
  let itemList: [ItemList]
  
  enum CodingKeys: String, CodingKey {
    case categoryImg = "category_img"
    case subCategories = "sub_categories"
    case itemList = "item_list"
  }
}

struct ItemList: Codable {
  let itemPk, company, itemName: String
  let originPrice, salePrice: Int
  let discountRate: Double
  let listThumbnail: String
  
  enum CodingKeys: String, CodingKey {
    case itemPk = "item_pk"
    case company
    case itemName = "item_name"
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case listThumbnail = "list_thumbnail"
  }
}

struct SubCategory: Codable {
  let categoryPk, mainCategory, subCategory: String
  let photo: String
  
  enum CodingKeys: String, CodingKey {
    case categoryPk = "category_pk"
    case mainCategory = "main_category"
    case subCategory = "sub_category"
    case photo
  }
}
