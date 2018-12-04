//
//  FixedBaner.swift
//  WoowahanFresh
//
//  Created by qbbang on 03/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import Foundation
import RealmSwift

class FixedBaner: Object {
  @objc dynamic var mainBanner: Data? = nil
//  @objc dynamic var proviceName = ""
//  @objc dynamic var conturyName = ""
  
}

let url = URL(string: "http://wps-docker-master.ap-northeast-2.elasticbeanstalk.com/api/categories/1")!



/*
func imageURLForName(_ name: String) -> URL {
  return URL(string: "https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/" + name.addingPercentEncoding(withAllowedCharacters: CharacterSet.alphanumerics)! + ".png")!
}

class Test: Object {
  
  // MARK: - Init
  convenience init(name: String) {
    self.init()
    self.name = name
  }
  
  // MARK: - Properties
  @objc dynamic var name = ""
  @objc dynamic var sent = 0
  
  var avatarUrl: URL {
    return imageURLForName(self.name)
  }
  
  // MARK: - Meta
  override static func primaryKey() -> String? {
    return "name"
  }
  
  // MARK: - Etc
  
}
*/
