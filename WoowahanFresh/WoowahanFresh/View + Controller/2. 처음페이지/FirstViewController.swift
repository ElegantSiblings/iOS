//
//  HomeViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 29/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

  
    override func viewDidLoad() {
        super.viewDidLoad()
      
      //FIXME: 스토리보드에 적용 했는데, 표현이 안되서 코드로 한번더 작성 함.
      tabBarController?.tabBar.items![1].title = "카테고리"
      tabBarController?.tabBar.items![1].image = UIImage(named: "category")
      tabBarController?.tabBar.items![2].title = "마이페이지"
      tabBarController?.tabBar.items![2].image = UIImage(named: "my")
    }
  
}
