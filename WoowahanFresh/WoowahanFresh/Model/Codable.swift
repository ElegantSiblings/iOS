// To parse the JSON, add this file to your project and do:
//
//   let itemList = try? newJSONDecoder().decode(ItemList.self, from: jsonData)

import Foundation

//MARK: 아이템 분류 정보
struct ItemList: Codable {
  let currentCategories: CurrentCategories
  let subCategories: [CurrentCategories]
  let itemList: [ItemListElement]
  let pageList: [JSONAny]
  let page: JSONNull?
  
  enum CodingKeys: String, CodingKey {
    case currentCategories = "current_categories"
    case subCategories = "sub_categories"
    case itemList = "item_list"
    case pageList = "page_list"
    case page
  }
}

struct CurrentCategories: Codable {
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

struct ItemListElement: Codable {
  let pk: Int
  let itemName, company: String
  let originPrice, salePrice: Int
  let discountRate: Double
  let listThumbnail: String
  
  enum CodingKeys: String, CodingKey {
    case pk
    case itemName = "item_name"
    case company
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case listThumbnail = "list_thumbnail"
  }
}

//MARK: 아이템 상세정보
struct ItemDetails: Codable {
  let pk: Int
  let company, itemName: String
  let originPrice, salePrice: Int
  let discountRate: Double
  let description: Description
  let itemimageSet: [ItemimageSet]
  let commentSet: [JSONAny]
  
  enum CodingKeys: String, CodingKey {
    case pk, company
    case itemName = "item_name"
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case description
    case itemimageSet = "itemimage_set"
    case commentSet = "comment_set"
  }
}

struct Description: Codable {
  let pk, item: Int
  let addedWords: String
  let point: Int
  let deliveryType, receiveDay: String
  let regularDelivery: Bool
  let itemType, factoryAddress, dom, capacity: String
  let ingredient, allergyMaterial, caution: String
  
  enum CodingKeys: String, CodingKey {
    case pk, item
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
  let pk, item: Int
  let photoType: PhotoType
  let imageOrder: Int
  let photo: String
  
  enum CodingKeys: String, CodingKey {
    case pk, item
    case photoType = "photo_type"
    case imageOrder = "image_order"
    case photo
  }
}

enum PhotoType: String, Codable {
  case d = "D"
  case t = "T"
}
//MARK: 로그인 정보
struct UserInfo: Codable {
  let user: User
  let token: String
}

struct User: Codable {
  let userPk, username, firstName, lastName: String
  let email: String
  let imgProfile: JSONNull?
  
  enum CodingKeys: String, CodingKey {
    case userPk = "user_pk"
    case username
    case firstName = "first_name"
    case lastName = "last_name"
    case email
    case imgProfile = "img_profile"
  }
}

//MARK: 검색 결과
struct SearchList: Codable {
  let items: [SearchItem]
  let pageList: [JSONAny]
  let page: JSONNull?
  
  enum CodingKeys: String, CodingKey {
    case items
    case pageList = "page_list"
    case page
  }
}

struct SearchItem: Codable {
  let pk: Int
  let itemName, company: String
  let originPrice, salePrice: Int
  let discountRate: Double
  let listThumbnail: String?
  
  enum CodingKeys: String, CodingKey {
    case pk
    case itemName = "item_name"
    case company
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case listThumbnail = "list_thumbnail"
  }
}


//MARK: 장바구니 결과

typealias ShoppingList = [ShoppingListElement]

struct ShoppingListElement: Codable {
  let pk, user: Int
  let item: ShopItem
  let amount: Int
}

struct ShopItem: Codable {
  let pk: Int
  let itemName, company: String
  let originPrice, salePrice: Int
  let discountRate: Double
  let listThumbnail: String
  
  enum CodingKeys: String, CodingKey {
    case pk
    case itemName = "item_name"
    case company
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case listThumbnail = "list_thumbnail"
  }
}


//MARK: 주문 결과
struct OrderResult: Codable {
  let pk, user: Int
  let orderDateTime, deliveryDate: String
  let totalPrice: Int
  let address: String
  let cartItems: [CartItem]
  
  enum CodingKeys: String, CodingKey {
    case pk, user
    case orderDateTime = "order_date_time"
    case deliveryDate = "delivery_date"
    case totalPrice = "total_price"
    case address
    case cartItems = "cart_items"
  }
}

struct CartItem: Codable {
  let pk, user: Int
  let item: Item
  let amount: Int
}

struct Item: Codable {
  let pk: Int
  let itemName, company: String
  let originPrice, salePrice: Int
  let discountRate: Double
  let listThumbnail: String
  
  enum CodingKeys: String, CodingKey {
    case pk
    case itemName = "item_name"
    case company
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case listThumbnail = "list_thumbnail"
  }
}

//MARK: 특정 주문 조회
struct OrderCheck: Codable {
  let pk, user: Int
  let orderDateTime, deliveryDate: String
  let totalPrice: Int
  let address: String
  let cartItems: [CartItems]
  
  enum CodingKeys: String, CodingKey {
    case pk, user
    case orderDateTime = "order_date_time"
    case deliveryDate = "delivery_date"
    case totalPrice = "total_price"
    case address
    case cartItems = "cart_items"
  }
}

struct CartItems: Codable {
  let pk, user: Int
  let item: ItemCheck
  let amount: Int
}

struct ItemCheck: Codable {
  let pk: Int
  let itemName, company: String
  let originPrice, salePrice: Int
  let discountRate: Double
  let listThumbnail: String
  
  enum CodingKeys: String, CodingKey {
    case pk
    case itemName = "item_name"
    case company
    case originPrice = "origin_price"
    case salePrice = "sale_price"
    case discountRate = "discount_rate"
    case listThumbnail = "list_thumbnail"
  }
}

// MARK: Encode/decode helpers

class JSONNull: Codable, Hashable {
  
  public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
    return true
  }
  
  public var hashValue: Int {
    return 0
  }
  
  public init() {}
  
  public required init(from decoder: Decoder) throws {
    let container = try decoder.singleValueContainer()
    if !container.decodeNil() {
      throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    var container = encoder.singleValueContainer()
    try container.encodeNil()
  }
}

class JSONCodingKey: CodingKey {
  let key: String
  
  required init?(intValue: Int) {
    return nil
  }
  
  required init?(stringValue: String) {
    key = stringValue
  }
  
  var intValue: Int? {
    return nil
  }
  
  var stringValue: String {
    return key
  }
}

class JSONAny: Codable {
  let value: Any
  
  static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
    let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
    return DecodingError.typeMismatch(JSONAny.self, context)
  }
  
  static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
    let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
    return EncodingError.invalidValue(value, context)
  }
  
  static func decode(from container: SingleValueDecodingContainer) throws -> Any {
    if let value = try? container.decode(Bool.self) {
      return value
    }
    if let value = try? container.decode(Int64.self) {
      return value
    }
    if let value = try? container.decode(Double.self) {
      return value
    }
    if let value = try? container.decode(String.self) {
      return value
    }
    if container.decodeNil() {
      return JSONNull()
    }
    throw decodingError(forCodingPath: container.codingPath)
  }
  
  static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
    if let value = try? container.decode(Bool.self) {
      return value
    }
    if let value = try? container.decode(Int64.self) {
      return value
    }
    if let value = try? container.decode(Double.self) {
      return value
    }
    if let value = try? container.decode(String.self) {
      return value
    }
    if let value = try? container.decodeNil() {
      if value {
        return JSONNull()
      }
    }
    if var container = try? container.nestedUnkeyedContainer() {
      return try decodeArray(from: &container)
    }
    if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
      return try decodeDictionary(from: &container)
    }
    throw decodingError(forCodingPath: container.codingPath)
  }
  
  static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
    if let value = try? container.decode(Bool.self, forKey: key) {
      return value
    }
    if let value = try? container.decode(Int64.self, forKey: key) {
      return value
    }
    if let value = try? container.decode(Double.self, forKey: key) {
      return value
    }
    if let value = try? container.decode(String.self, forKey: key) {
      return value
    }
    if let value = try? container.decodeNil(forKey: key) {
      if value {
        return JSONNull()
      }
    }
    if var container = try? container.nestedUnkeyedContainer(forKey: key) {
      return try decodeArray(from: &container)
    }
    if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
      return try decodeDictionary(from: &container)
    }
    throw decodingError(forCodingPath: container.codingPath)
  }
  
  static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
    var arr: [Any] = []
    while !container.isAtEnd {
      let value = try decode(from: &container)
      arr.append(value)
    }
    return arr
  }
  
  static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
    var dict = [String: Any]()
    for key in container.allKeys {
      let value = try decode(from: &container, forKey: key)
      dict[key.stringValue] = value
    }
    return dict
  }
  
  static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
    for value in array {
      if let value = value as? Bool {
        try container.encode(value)
      } else if let value = value as? Int64 {
        try container.encode(value)
      } else if let value = value as? Double {
        try container.encode(value)
      } else if let value = value as? String {
        try container.encode(value)
      } else if value is JSONNull {
        try container.encodeNil()
      } else if let value = value as? [Any] {
        var container = container.nestedUnkeyedContainer()
        try encode(to: &container, array: value)
      } else if let value = value as? [String: Any] {
        var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
        try encode(to: &container, dictionary: value)
      } else {
        throw encodingError(forValue: value, codingPath: container.codingPath)
      }
    }
  }
  
  static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
    for (key, value) in dictionary {
      let key = JSONCodingKey(stringValue: key)!
      if let value = value as? Bool {
        try container.encode(value, forKey: key)
      } else if let value = value as? Int64 {
        try container.encode(value, forKey: key)
      } else if let value = value as? Double {
        try container.encode(value, forKey: key)
      } else if let value = value as? String {
        try container.encode(value, forKey: key)
      } else if value is JSONNull {
        try container.encodeNil(forKey: key)
      } else if let value = value as? [Any] {
        var container = container.nestedUnkeyedContainer(forKey: key)
        try encode(to: &container, array: value)
      } else if let value = value as? [String: Any] {
        var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
        try encode(to: &container, dictionary: value)
      } else {
        throw encodingError(forValue: value, codingPath: container.codingPath)
      }
    }
  }
  
  static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
    if let value = value as? Bool {
      try container.encode(value)
    } else if let value = value as? Int64 {
      try container.encode(value)
    } else if let value = value as? Double {
      try container.encode(value)
    } else if let value = value as? String {
      try container.encode(value)
    } else if value is JSONNull {
      try container.encodeNil()
    } else {
      throw encodingError(forValue: value, codingPath: container.codingPath)
    }
  }
  
  public required init(from decoder: Decoder) throws {
    if var arrayContainer = try? decoder.unkeyedContainer() {
      self.value = try JSONAny.decodeArray(from: &arrayContainer)
    } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
      self.value = try JSONAny.decodeDictionary(from: &container)
    } else {
      let container = try decoder.singleValueContainer()
      self.value = try JSONAny.decode(from: container)
    }
  }
  
  public func encode(to encoder: Encoder) throws {
    if let arr = self.value as? [Any] {
      var container = encoder.unkeyedContainer()
      try JSONAny.encode(to: &container, array: arr)
    } else if let dict = self.value as? [String: Any] {
      var container = encoder.container(keyedBy: JSONCodingKey.self)
      try JSONAny.encode(to: &container, dictionary: dict)
    } else {
      var container = encoder.singleValueContainer()
      try JSONAny.encode(to: &container, value: self.value)
    }
  }
}

