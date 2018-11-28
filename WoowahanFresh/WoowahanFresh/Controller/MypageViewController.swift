//
//  MypageViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 27/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class MypageViewController: UIViewController {

  var homeViewTop: HomeViewTop!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      homeViewTop =  HomeViewTop(frame: CGRect.zero)
      homeViewTop.btnShopping.backgroundColor = .yellow
      homeViewTop.btnHome.isHidden = true
      
      view.addSubview(homeViewTop)
      homeViewTop.translatesAutoresizingMaskIntoConstraints = false
      homeViewTop.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
