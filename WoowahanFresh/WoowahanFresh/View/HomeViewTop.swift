//
//  HomeView.swift
//  WoowahanFresh
//
//  Created by qbbang on 27/11/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class HomeViewTop: UIView {
  
  var topViewOne: UIView!
  var topViewTwo: UIView!
  
  var btnHome: UIButton!
  var btnSearch: UIButton!
  var btnShopping: UIButton!
  
  var btntest: UIButton!
  var btntestt: UIButton!
  
  let screenSize = UIScreen.main.bounds
  let imageBtnHome = UIImage(named: "BMC")
  let imageBtnSearch = UIImage(named: "search")
  let imageBtnShopping = UIImage(named: "shopping")
  
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    makeTopView()
    addTopViewButton()
    
    btntest = UIButton(frame: CGRect(
      x: screenSize.minX,
      y: screenSize.minY + 42,
      width: screenSize.width / 4.8,
      height: screenSize.height / 19
    ))
    btntest.backgroundColor = .black
    self.addSubview(btntest)
    
    btntestt = UIButton(frame: CGRect(
      x: screenSize.minX + 150,
      y: screenSize.minY + 42,
      width: screenSize.width / 4.8,
      height: screenSize.height / 19
    ))
    btntestt.backgroundColor = .green
    self.addSubview(btntestt)
   }
   
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  func makeTopView() {
    // MARK: topView 1/2
    topViewOne = UIView(frame: CGRect(
      x: screenSize.minX,
      y: screenSize.minY,
      width: screenSize.width,
      height: screenSize.height / 19
    ))
    
    self.addSubview(topViewOne)
    
    // MARK: topView 2/2
    topViewTwo = UIView(frame: CGRect(
      x: screenSize.minX,
      y: ((screenSize.height / 19) + 1),
      width: screenSize.width,
      height: screenSize.height / 19
    ))
    
    self.addSubview(topViewTwo)
    topViewTwo.backgroundColor = .red
  }
  
  func addTopViewButton() {
    // MARK: View 탑의 홈, Event -> 홈으로
    btnHome = UIButton(frame:  CGRect(
      x: screenSize.minX - 1,
      y: screenSize.minY,
      width: screenSize.width / 4.8,
      height: screenSize.height / 19
    ))
    
    btnHome.setImage(imageBtnHome, for: .normal)
    self.topViewOne.addSubview(btnHome)
    
    // MARK: View 탑의 검색, Event -> 네비게이션(show?), 상품 검색
    btnSearch = UIButton(frame: CGRect(
      x: (screenSize.width - ((screenSize.width / 8.9) * 2) - 1 ),
      y: 0,
      width: screenSize.width / 8.9,
      height: screenSize.height / 19
    ))
    
    btnSearch.setImage(imageBtnSearch, for: .normal)
    topViewOne.addSubview(btnSearch)
    
    // MARK: View 탑의 장바구니, Event -> 네비게이션(show?), 장바구니
    btnShopping = UIButton(frame: CGRect(
      x: (screenSize.width - screenSize.width / 8.9) ,
      y: 0,
      width: screenSize.width / 8.9,
      height: screenSize.height / 19
    ))
    
    btnShopping.setImage(imageBtnShopping, for: .normal)
    topViewOne.addSubview(btnShopping)
  }
  
}

