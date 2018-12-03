//
//  ViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 26/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class MainViewController: UIViewController {
  
  let loadingView = UIActivityIndicatorView(style: .whiteLarge)
  let logoView = UIImageView()
  let 
  var timer = Timer()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    requestData(url: <#T##URL#>)
    
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
  func requestData(url _url: URL ) {
    Alamofire.request(_url, method: .get)
      .validate()
      .responseJSON { (response) in
        print(Alamofire.request(url, method: .get))
        switch response.result {
        case .success(let value):
          guard let parser = value as? [[String: Any]] else { return }
          let test = parser[0]
          let company = test["company"]!
          let itemname = test["item_name"]!
          let price = test["origin_price"]!
          let imageString = test["list_thumbnail"]!
          let url = URL(string: imageString as! String)
          testSigntion.shard.testname = parser[0]
          print("=====inside=========")
          print(testSigntion.shard.testname)
          print("=====xxxxxxxx=========")
          self.naming.text = "[\(company)] \(itemname) \(price)]"
          
          
          URLSession.shared.dataTask(with: url!, completionHandler: { (data, res, error) in
            if let error = error {
              return print(error.localizedDescription)
            }
            guard let data = data, let image = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
              self.imageview.image = image
            }
          }).resume()
          
        case .failure(let error):
          print(error.localizedDescription)
        }
    }
  }
  
  func countDown() {
    timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { (Timer) in
      let storyboard = UIStoryboard(name: "First", bundle: nil)
      
      /*
      // Master스토리보드의 aaa Id를 가진 애로 가랏
      let storyboardID = "aaa"
      let masterVC = storyboard.instantiateViewController(withIdentifier: storyboardID)
      */
      //  해당 스토리보드의 inial로 가라!
      let masterVC = storyboard.instantiateInitialViewController()!
      
      self.present(masterVC, animated: false, completion: {
        print("masterVC로 전달 사항있니?")
      })
      
    }
  }
  
}




