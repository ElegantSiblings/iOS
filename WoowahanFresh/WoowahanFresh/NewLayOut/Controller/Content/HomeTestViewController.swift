//
//  HomeTestViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 04/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class HomeTestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  func requestData(url: String, handler: @escaping (Data) -> Void) {
    //MARK: 이미지 데이터 요청
    Alamofire.request(url, method: .get)
      .validate()
      .responseData { (response) in
        print(Alamofire.request(url, method: .get))
        switch response.result {
        case .success(let value):
          
          handler(value)
          
        case .failure(let error):
          print("error = ", error.localizedDescription)
        }
        
    }
  }
    
  @IBAction func 밑반찬(_ sender: Any) {
    print(1)
//    let storyboard = UIStoryboard(name: "Item", bundle: nil)
//    
//    let masterVC = storyboard.instantiateInitialViewController()!
//    
//    self.show(masterVC, sender: Any?.self)
//    self.present(masterVC, animated: false, completion: {
//      print("버튼의 카테고리명 -> 네이게이션바 타이틀")
//      print("버튼이 누른 위치?")
//    
//    })
  }
  
  @IBAction func 메인반찬(_ sender: Any) {
    print(2)
  }
  
  @IBAction func 국찌개탕(_ sender: Any) {
    print(3)
  }
  
  @IBAction func 아이반찬(_ sender: Any) {
    print(4)
  }
  
  @IBAction func 밥죽면(_ sender: Any) {
    print(5)
  }
  
}
