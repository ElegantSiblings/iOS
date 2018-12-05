//
//  Codable.swift
//  WoowahanFresh
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//
import Foundation

typealias CategoryTotal = [CategoryTotalElement]

struct CategoryTotalElement: Codable {
  let categoryPk, mainCategory, subCategory: String
  let photo: String
  
  enum CodingKeys: String, CodingKey {
    case categoryPk = "category_pk"
    case mainCategory = "main_category"
    case subCategory = "sub_category"
    case photo
  }
}

final class CategoryTotalData {
  static let shared = CategoryTotalData()
  var arrayOfCategoryTotalData: CategoryTotal = []
  
  func getDataFromServer() { // 서버에서 데이터 가져오는 펑션
    
    guard let url = URL(string: "http://wps-docker-master.ap-northeast-2.elasticbeanstalk.com/api/categories/") else { return }
    guard let data = try? Data(contentsOf: url) else { return }
    
    let CategoryData = try! JSONDecoder().decode(CategoryTotal.self, from: data)
    arrayOfCategoryTotalData = CategoryData
  }
  
}
