//
//  ViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 26/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

import Alamofire
import RealmSwift

class MainViewController: UIViewController {
  
  let loadingView = UIActivityIndicatorView(style: .whiteLarge)
  let logoView = UIImageView()
  var timer = Timer()
  
  let url = "https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/bmc-logo.png"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    requestData(url: url) { (Data) in
      DispatchQueue.main.async {
        self.logoView.image = UIImage(data: Data)
      }
    }
    
    // MARK: 3초 뒤에 다음 화면으로 이동,
    // 나중에는 데이터 적재 후 이동하는 것으로 변경 할 것
    countDown()
    
    // MARK: Logo - 배민찬
    logoView.frame = CGRect(x: 0, y: 0, width: 375, height: 120)
    logoView.image = UIImage(named: "logoView")
    logoView.center = view.center
    
    print(view.safeAreaInsets)
    // MARK: Indicatior
    loadingView.center = CGPoint(
      x: view.center.x,
      y: view.center.y + (logoView.frame.height / 2) + 50)
    loadingView.color = UIColor.orange
    loadingView.startAnimating()
    
    
    view.addSubview(logoView)
    view.addSubview(loadingView)
    
    
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
  
  
  func countDown() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (Timer) in
      
      let storyboard = UIStoryboard(name: "First", bundle: nil)
      let firstVC = storyboard.instantiateInitialViewController()!
//      navigationController?.presentationController.
//      self.present(firstVC, animated: false)
      
      self.navigationController?.pushViewController(firstVC, animated: false)
      //setViewControllers([firstVC], animated: false)
      /*
      let storyboard = UIStoryboard(name: "First", bundle: nil)
      
       // Master스토리보드의 aaa Id를 가진 애로 가랏
       let storyboardID = "aaa"
       let masterVC = storyboard.instantiateViewController(withIdentifier: storyboardID)
       
      //  해당 스토리보드의 inial로 가라!
      let masterVC = storyboard.instantiateInitialViewController()!
      
      self.present(masterVC, animated: false, completion: {
        print("masterVC로 전달 사항있니?")
      })
      */
    }
  }
  
}




