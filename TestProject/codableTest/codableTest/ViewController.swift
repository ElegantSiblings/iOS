//
//  ViewController.swift
//  codableTest
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  @IBAction func btnRequestCodable(_ sender: Any) {
    let url = URL(string: "http://wps-docker-master.ap-northeast-2.elasticbeanstalk.com/api/categories/?category_pk=1")!
    let data = try! Data(contentsOf: url)
    let temp = try! JSONDecoder().decode(Welcome.self, from: data)
    
    print(temp)
  }
  
}

