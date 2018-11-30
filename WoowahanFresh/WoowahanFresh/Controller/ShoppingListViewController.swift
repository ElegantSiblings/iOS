//
//  ShoppingListViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 28/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ShoppingListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func btnAthome(_ sender: Any) {
    let storyboard = UIStoryboard(name: "Master", bundle: nil)
    
    let masterVC = storyboard.instantiateInitialViewController()!
    
    self.present(masterVC, animated: true, completion: {
      print("ShoppingListView -> HomeView")
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
