//
//  ModelItem.swift
//  WoowahanFresh
//
//  Created by qbbang on 05/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation

struct Item: Codable {
  let itemPk, company, itemName: String
  let originPrice, salePrice, discountRate: Int
  let description: Description
  let itemimageSet: [ItemimageSet]
  
  enum CodingKeys: String, CodingKey {
    case itemPk = "item_pk"
    case company
    case itemName = "item_name"
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case description
    case itemimageSet = "itemimage_set"
  }
}

struct Description: Codable {
  let itemPk, descriptionPk, addedWords: String
  let point: Int
  let deliveryType, receiveDay: String
  let regularDelivery: Bool
  let itemType, factoryAddress, dom, capacity: String
  let ingredient, allergyMaterial, caution: String
  
  enum CodingKeys: String, CodingKey {
    case itemPk = "item_pk"
    case descriptionPk = "description_pk"
    case addedWords = "added_words"
    case point
    case deliveryType = "delivery_type"
    case receiveDay = "receive_day"
    case regularDelivery = "regular_delivery"
    case itemType = "item_type"
    case factoryAddress = "factory_address"
    case dom, capacity, ingredient
    case allergyMaterial = "allergy_material"
    case caution
  }
}

struct ItemimageSet: Codable {
  let itemPk, itemImagePk: String
  let photoType: PhotoType
  let imageOrder: Int
  let photo: String
  
  enum CodingKeys: String, CodingKey {
    case itemPk = "item_pk"
    case itemImagePk = "item_image_pk"
    case photoType = "photo_type"
    case imageOrder = "image_order"
    case photo
  }
}

enum PhotoType: String, Codable {
  case d = "D"
  case t = "T"
}
