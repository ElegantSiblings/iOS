//
//  SearchViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 28/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
  
  @IBAction func btnAthome(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Master", bundle: nil)
    
    let masterVC = storyboard.instantiateInitialViewController()!
    
    /*present방식 화면전환을 할 때 push형태의 애니메이션으로 표현하기
    let transition = CATransition()
    transition.duration = 0.5
    transition.type = CATransitionType.push
    transition.subtype = CATransitionSubtype.fromRight
    view.window!.layer.add(transition, forKey: kCATransition)
    */
    self.present(masterVC, animated: true, completion: {
      print("SearchView -> HomeView")
    })
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
