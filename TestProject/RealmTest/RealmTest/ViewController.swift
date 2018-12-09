//
//  ViewController.swift
//  RealmTest
//
//  Created by qbbang on 03/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

  //MARK: Outlet
  @IBOutlet weak var cityText: UITextField!
  
  @IBOutlet weak var provinceText: UITextField!
  
  @IBOutlet weak var countryText: UITextField!
  
  @IBOutlet weak var searchResult: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  //MARK: func btn
  @IBAction func btnSave(_ sender: Any) {
    let cityName = self.cityText.text
    let provinceName = self.provinceText.text
    let countryName = self.countryText.text
    
    if (cityName?.isEmpty)! {
      self.cityText.layer.borderColor = UIColor.red.cgColor
      
    } else {
       self.cityText.layer.borderColor = UIColor.black.cgColor
      
    }
    
    if (provinceName?.isEmpty)! {
      self.provinceText.layer.borderColor = UIColor.red.cgColor
      
    } else {
      self.provinceText.layer.borderColor = UIColor.black.cgColor
      
    }
    
    if (countryName?.isEmpty)! {
      self.countryText.layer.borderColor = UIColor.red.cgColor
      
    } else {
      self.countryText.layer.borderColor = UIColor.black.cgColor
      
    }
    
    let newCity = CityLib()
    newCity.setValue(self.cityText.text, forKey: "cityName")
    newCity.setValue(self.provinceText.text, forKey: "proviceName")
    newCity.setValue(self.countryText.text, forKey: "conturyName")
    
    let realm = try! Realm()
    
    do {
      try realm.write {
        realm.add(newCity)
        print("Added \(newCity.cityName) to Realm DataBase")
        
        self.cityText.text = ""
        self.provinceText.text = ""
        self.countryText.text = ""
        
      }
    } catch {
      print(error)
    }
  }
  
  @IBAction func btnSearch(_ sender: Any) {
    let searchString = self.searchResult.text
    let realm = try! Realm()
    var outputStr = ""
    
    let predicate = NSPredicate(format: "cityName contains[c] %@", searchString!)
    let result = realm.objects(CityLib.self).filter(predicate)
    
    if result.count > 0 {
      for oneline in result {
        let oneCity = (oneline as AnyObject).value(forKey: "cityName") as! String
        let oneProvince = (oneline as AnyObject).value(forKey: "provinceName") as! String
        let oneCountry = (oneline as AnyObject).value(forKey: "countryName") as! String
        
        outputStr += oneCity + " " + oneProvince + " " + oneCountry + "\n"
      }
    } else {
      outputStr = "No match Found"
    }
    self.searchResult?.text = outputStr
  }
  
  @IBAction func btnShowAll(_ sender: Any) {
  }
  
}

