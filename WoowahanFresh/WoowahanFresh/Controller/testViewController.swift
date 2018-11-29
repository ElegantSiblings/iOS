//
//  DishTesViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 29/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class testViewController: UIViewController {
  
  var output: [String : Any] = [:]
  
  @IBOutlet weak var naming: UILabel!
  @IBOutlet weak var imageview: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let url = URL(string: "http://wps-docker-master.ap-northeast-2.elasticbeanstalk.com/api/categories/1")!
    
    
    Alamofire.request(url, method: .get)
      .validate()
      .responseJSON { (response) in
        print("++++++++++++++++++")
        print("++++++++++++++++++")
        print(Alamofire.request(url, method: .get))
        print("++++++++++++++++++")
        print("++++++++++++++++++")
        switch response.result {
        case .success(let value):
          print("========")
          print("========")
          print(value)
          print("========")
          print("========")
          
          guard let parser = value as? [[String: Any]] else { return }
          
          
          let test = parser[0]
          let company = test["company"]!
          let itemname = test["item_name"]!
          let price = test["origin_price"]!
          let imageString = test["list_thumbnail"]!
          let url = URL(string: imageString as! String)
          
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

@IBAction func atHome(_ sender: Any) {
  let storyboard = UIStoryboard(name: "Master", bundle: nil)
  
  let masterVC = storyboard.instantiateInitialViewController()!
  
  self.present(masterVC, animated: true, completion: {
    print("SearchView -> HomeView")
  })
}
}

