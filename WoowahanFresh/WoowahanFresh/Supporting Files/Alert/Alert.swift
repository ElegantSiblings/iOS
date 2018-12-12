//
//  alert.swift
//  WoowahanFresh
//
//  Created by qbbang on 12/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

struct Alert {
  
  //MARK: alert - 로그인 하세요
  static func loginCheck(viewController: UIViewController) {
    let alert = UIAlertController(title: "로그인을 하세요", message: nil, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
      alert.dismiss(animated: true)
    }))
    
    viewController.present(alert, animated: true)
  }
  
  //MARK: alert - 쇼핑 리스트 추가 완료
  static func addItem(viewController: UIViewController) {
    let alert = UIAlertController(title: "장바구니 담기 완료!", message: nil, preferredStyle: .alert)

    alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { action in
      alert.dismiss(animated: true)
    }))

    alert.addAction(UIAlertAction(title: "장바구니 이동", style: .default, handler: { action in
      alert.dismiss(animated: true)
    }))
    
    viewController.present(alert, animated: true)
  }
}
