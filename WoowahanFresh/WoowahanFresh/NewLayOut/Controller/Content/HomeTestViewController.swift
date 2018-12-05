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
  
  var welcome = [Welcome]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
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
  
  
  func requestCodable(url: String, handler: @escaping (Welcome) -> Void) {
    Alamofire.request(url, method: .get)
      .validate()
      .responseJSON { (response) in
        let json = response.data
        
        do{
          //created the json decoder
          let decoder = JSONDecoder()
          
          //using the array to put values
          self.welcome = [try decoder.decode(Welcome.self, from: json!)]
          print("======")
          
          print(self.welcome)
          
        }catch let err{
          print(err)
        }
    }
  }
  
  @IBAction func 밑반찬(_ sender: Any) {
    //MARK: 데이터 요청
    let url = "http://wps-docker-master.ap-northeast-2.elasticbeanstalk.com/api/categories/?category_pk=1"
    requestCodable(url: url) { (Welcome) in
      //      var welcome2 = [Welcome]()
      print(Welcome.itemList[0].company)
      for _ in 0..<5 {
        print("+++++++++++")
      }
      print(self.welcome)
    }
    
    //MARK: 화면전환
    let storyboard = UIStoryboard(name: "ItemList", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
    guard let nextVC = vc as? ItemListViewController else { return }
    self.present(nextVC, animated: false, completion: {
      DispatchQueue.main.async {
        self.welcome.
        nextVC.titleStr.text = "밑반찬"
        nextVC.labelTest.text = "밑반찬 - 내용"
      }
    })
  }
  
  @IBAction func 메인반찬(_ sender: Any) {
    let storyboard = UIStoryboard(name: "ItemList", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
    guard let nextVC = vc as? ItemListViewController else { return }
    self.present(nextVC, animated: false, completion: {
      DispatchQueue.main.async {
        
        nextVC.titleStr.text = "메인반찬"
        nextVC.labelTest.text = "메인반찬 - 내용"
      }
    })
  }
  
  @IBAction func 국찌개탕(_ sender: Any) {
    let storyboard = UIStoryboard(name: "ItemList", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ItemListViewController")
    guard let nextVC = vc as? ItemListViewController else { return }
    self.present(nextVC, animated: false, completion: {
      DispatchQueue.main.async {
        
        nextVC.titleStr.text = "국찌개탕"
        nextVC.labelTest.text = "국찌개탕 - 내용"
      }
    })
  }
  
  @IBAction func 아이반찬(_ sender: Any) {
    let storyboard = UIStoryboard(name: "ItemList", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ItemViewController")
    guard let nextVC = vc as? ItemListViewController else { return }
    self.present(nextVC, animated: false, completion: {
      DispatchQueue.main.async {
        
        nextVC.titleStr.text = "아이반찬"
        nextVC.labelTest.text = "아이반찬 - 내용"
      }
    })
  }
  
  @IBAction func 밥죽면(_ sender: Any) {
    let storyboard = UIStoryboard(name: "ItemList", bundle: nil)
    let vc = storyboard.instantiateViewController(withIdentifier: "ItemViewController")
    guard let nextVC = vc as? ItemListViewController else { return }
    self.present(nextVC, animated: false, completion: {
      DispatchQueue.main.async {
        
        nextVC.titleStr.text = "밥죽면"
        nextVC.labelTest.text = "밥죽면 - 내용"
      }
    })
  }
  
}
