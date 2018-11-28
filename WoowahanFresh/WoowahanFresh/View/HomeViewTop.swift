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
  var btnHome: UIButton!
  var btnSearch: UIButton!
  var btnShopping: UIButton!
  
  var topViewTwo: UIView!
  
  override init(frame: CGRect) {
    super.init(frame: frame)

    // MARK: topView 1/2
    topViewOne = UIView(frame: CGRect(
      x: self.frame.minX,
      y: self.frame.midY,
      width: self.frame.width,
      height: self.frame.height / 20))  // X, XS 기준 40.6
    
    topViewOne.translatesAutoresizingMaskIntoConstraints = false
    
    self.addSubview(topViewOne)
    
    // MARK: View 탑의 홈, Event -> 홈으로
    btnHome = UIButton(frame: CGRect.zero)
    btnHome.frame = CGRect(
      x: self.frame.minX,
      y: self.frame.midY,
      width: self.frame.width / 5, // X, XS 기준 75
      height: self.frame.height / 20)
    
    let imageBtnHome = UIImage(named: "BMC")
    btnHome.setImage(imageBtnHome, for: .normal)
    topViewOne.addSubview(btnHome)
    
    // MARK: View 탑의 검색, Event -> 네비게이션(show?), 상품 검색
    btnSearch = UIButton(frame: CGRect.zero)
    btnSearch.frame = CGRect(//x:267, y: 0, width: 54, height: 42)
    x: (self.frame.minX / 7) * 6, // X, XS 기준 321.xxx
    y: self.frame.midY,
    width: self.frame.width / 7, // // X, XS 기준 53.571
    height: self.frame.height / 20)
    
    let imageBtnSearch = UIImage(named: "search")
    btnSearch.setImage(imageBtnSearch, for: .normal)
    topViewOne.addSubview(btnSearch)
    
    // MARK: View 탑의 장바구니, Event -> 네비게이션(show?), 장바구니
    btnShopping = UIButton(frame: CGRect.zero)
    btnShopping.frame = CGRect(//x: 321, y: 0, width: 54, height: 42)
    x: (self.frame.minX / 7) * 5, // X, XS 기준 267.xxx
    y: self.frame.midY,
    width: self.frame.width / 7, // X, XS 기준 53.571
    height: self.frame.height / 20)
    
    let imageBtnShopping = UIImage(named: "shopping")
    btnShopping.setImage(imageBtnShopping, for: .normal)
    topViewOne.addSubview(btnShopping)
    
    
    // MARK: topView 2/2
    topViewTwo = UIView(frame: CGRect.zero)
    topViewTwo.frame = CGRect(x: 0, y: 42, width: 325, height: 42)
    topViewTwo.backgroundColor = .yellow
    self.addSubview(topViewTwo)
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
}

