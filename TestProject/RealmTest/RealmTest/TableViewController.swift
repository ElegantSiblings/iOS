//
//  TableViewController.swift
//  RealmTest
//
//  Created by qbbang on 03/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  var CityArray: [CityLib] = []
  
    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.delegate = self
      tableView.dataSource = self
      
      fetchData()
      tableView.reloadData()
    }
  
  func fetchData() {
    let realm = try! Realm()
    
    CityArray = Array(realm.objects(CityLib.self))
    
    for person in CityArray {
      print("\(person.cityName) is in \(person.conturyName)")
    }
  }
  

}

extension TableViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return CityArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
    let name = CityArray[indexPath.row]
    
    cell.textLabel?.text = name.cityName + " " + name.proviceName + " " + name.conturyName
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    let city = CityArray[indexPath.row]
    
    let realm = try! Realm()
    
    do {
      try realm.write {
        realm.delete(city)
        CityArray.remove(at: indexPath.row)
      }
    } catch {
      print(error)
    }
    tableView.reloadData()
    
  }
  
  
}


extension TableViewController: UITableViewDelegate {

}
