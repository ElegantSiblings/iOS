//
//  ItemViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class ItemViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var timer = Timer()
  var itemPk: String = ""
  var itemValue: ItemDetails?
  var itemThumbnail: [String] = []
  var itemDeTalier: [String] = []
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("==== 현재 뷰컨트롤러 [ItemViewController] ====")
    tableView.delegate = self
    tableView.dataSource = self
    tableView.separatorStyle = .none
    
    //MARK: Section1 - 상품 정보 Custom Cell. 4개
    
    tableView.register(ScrollViewImageCell.self, forCellReuseIdentifier: "ScrollViewImageCell")
    tableView.register(UINib(nibName: "ItemTitleCell", bundle: nil), forCellReuseIdentifier: "ItemTitleCell")
    tableView.register(UINib(nibName: "ItemDeliveryCell", bundle: nil), forCellReuseIdentifier: "ItemDeliveryCell")
    tableView.register(UINib(nibName: "OtherItemCell", bundle: nil), forCellReuseIdentifier: "OtherItemCell")
    tableView.register(UINib(nibName: "ItemDetailCell", bundle: nil), forCellReuseIdentifier: "ItemDetailCell")
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    
    requestItem.detailInfo(pk: itemPk) { (ItemDetails) in
      print("콜백 성공")
      self.itemValue = ItemDetails
      let count = self.itemValue?.itemimageSet.count ?? 0
      
      for idx in 0..<count {
        if ItemDetails.itemimageSet[idx].photoType.rawValue == "T" {
          let urlString = ItemDetails.itemimageSet[idx].photo
          self.itemThumbnail.append(urlString)
        } else if ItemDetails.itemimageSet[idx].photoType.rawValue == "D" {
          let urlString = ItemDetails.itemimageSet[idx].photo
          self.itemDeTalier.append(urlString)
        }
      }
      
      self.tableView.reloadData()
    }
  }
  
  //MARK: 네비게이션 액션
  
  @IBAction func btnShare(_ sender: Any) {
    print("공유")
  }
  
  @IBAction func btnShopping(_ sender: Any) {
    print("쇼핑")
  }
  
  //MARK: 하단 버튼 액션
  
  @IBAction func btnHeart(_ sender: Any) {
    if SingleUserInfo.sharedInstance.token.isEmpty {
      Alert.loginCheck(viewController: self)
    } else {
      
    }
  }
  
  //MARK: 장바구니 담기 버튼,
  @IBAction func btnAddShoppingList(_ sender: Any) {
    
    if SingleUserInfo.sharedInstance.token.isEmpty {
      Alert.loginCheck(viewController: self)
    } else {
      requestCart.addItem(item_pk: itemPk)
      Alert.addItem(viewController: self)
    }
  }
  
  //MARK: 테이블뷰 헤더 CustomView
  func setBtnHeader(inView: UIView) {
    //: 높이는 heightForRowAtIndexPath 지정, 너비는 셀과 같음
    let btnDetails = UIButton(type: UIButton.ButtonType.system)
    let btnComment = UIButton(type: UIButton.ButtonType.system)
    let btnInquire = UIButton(type: UIButton.ButtonType.system)
    let btnTrade = UIButton(type: UIButton.ButtonType.system)
    
    //부모 뷰에서 불러올때 프레임을 직접 잡아주지 않으면 0 0 으로 옴
    print("view size ",view.frame.size)
    
    btnDetails.setTitle("상세정보", for: .normal)
    btnComment.setTitle("후기", for: .normal)
    btnInquire.setTitle("문의", for: .normal)
    btnTrade.setTitle("배송/교환", for: .normal)
    
    inView.addSubview(btnDetails)
    inView.addSubview(btnComment)
    inView.addSubview(btnInquire)
    inView.addSubview(btnTrade)
    
    inView.backgroundColor = .white
    //MARK: btn 배경색
    btnDetails.backgroundColor = .white
    btnComment.backgroundColor = .white
    btnInquire.backgroundColor = .white
    btnTrade.backgroundColor = .white

    //MARK: btn 테두리
    btnDetails.layer.borderWidth = 1.0
    btnDetails.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btnComment.layer.borderWidth = 1.0
    btnComment.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btnInquire.layer.borderWidth = 1.0
    btnInquire.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    btnTrade.layer.borderWidth = 1.0
    btnTrade.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    
    //MARK: btn 액션
    btnDetails.addTarget(self, action: #selector(didTapDetails), for: .touchUpInside)
    btnComment.addTarget(self, action: #selector(didTapComment), for: .touchUpInside)
    btnInquire.addTarget(self, action: #selector(didTapInquire), for: .touchUpInside)
    btnTrade.addTarget(self, action: #selector(didTapTrade(_:)), for: .touchUpInside)
    
    //MARK: 코드 오토레이아웃 설정
    btnDetails.translatesAutoresizingMaskIntoConstraints = false
    btnComment.translatesAutoresizingMaskIntoConstraints = false
    btnInquire.translatesAutoresizingMaskIntoConstraints = false
    btnTrade.translatesAutoresizingMaskIntoConstraints = false
    
    //MARK: topAnchor, leadingAnchor +
    btnDetails.topAnchor.constraint(equalTo: inView.topAnchor, constant: 10).isActive = true
    btnDetails.leadingAnchor.constraint(equalTo: inView.leadingAnchor, constant: 10).isActive = true
    btnDetails.bottomAnchor.constraint(equalTo: inView.bottomAnchor, constant: -10).isActive = true
    
    btnComment.topAnchor.constraint(equalTo: inView.topAnchor, constant: 10).isActive = true
    btnComment.leadingAnchor.constraint(equalTo: btnDetails.trailingAnchor, constant: 10).isActive = true
    btnComment.bottomAnchor.constraint(equalTo: inView.bottomAnchor, constant: -10).isActive = true
    
    btnInquire.topAnchor.constraint(equalTo: inView.topAnchor, constant: 10).isActive = true
    btnInquire.leadingAnchor.constraint(equalTo: btnComment.trailingAnchor, constant: 10).isActive = true
    btnInquire.bottomAnchor.constraint(equalTo: inView.bottomAnchor, constant: -10).isActive = true
    
    btnTrade.topAnchor.constraint(equalTo: inView.topAnchor, constant: 10).isActive = true
    btnTrade.leadingAnchor.constraint(equalTo: btnInquire.trailingAnchor, constant: 10).isActive = true
    btnTrade.trailingAnchor.constraint(equalTo: inView.trailingAnchor, constant: -10).isActive = true
    btnTrade.bottomAnchor.constraint(equalTo: inView.bottomAnchor, constant: -10).isActive = true
    
    //MARK: 기기의 넓이
    let originWidth = UIScreen.main.bounds.width
    //MARK: - 50은, 스페이스가 5개라 빼줌
    let objWidth = (originWidth - 50) / 4
    btnDetails.widthAnchor.constraint(equalToConstant: objWidth).isActive = true
    btnComment.widthAnchor.constraint(equalToConstant: objWidth).isActive = true
    btnInquire.widthAnchor.constraint(equalToConstant: objWidth).isActive = true
    btnTrade.widthAnchor.constraint(equalToConstant: objWidth).isActive = true
  }
  
  
  
  @objc func didTapDetails(_ sender: UIButton) {
    print("didTapDetails")
//    tableView.reloadSections([1, 2, 3], with: .none)
    tableView.reloadSections([1], with: UITableView.RowAnimation.none)
  }
  @objc func didTapComment(_ sender: UIButton) {
    print("didTapComment")
    tableView.reloadSections([1], with: UITableView.RowAnimation.none)
  }
  @objc func didTapInquire(_ sender: UIButton) {
    print("didTapInquire")
    
    tableView.reloadSections([1], with: UITableView.RowAnimation.none)
  }
  @objc func didTapTrade(_ sender: UIButton) {
    print("didTapTrade")
  }
  
}

extension ItemViewController: UITableViewDataSource, ScrollViewImageCellDelegate {
  
  //MARK: Section 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  //MARK: 헤더에 뷰 추가하기
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
    //MARK: 상세정보, 후기, 문의, 배송/교환
    if section == 1 {
      
      let view = UIView()
      setBtnHeader(inView: view)
      return view
    }
    
    return nil
  }
  
  //MARK: Section의 높이
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
  
  //  MARK: taview 높이
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    if indexPath.section == 0, indexPath.row == 0 {
      let size = CGFloat( ( Int(self.tableView.frame.maxY) / 4) * 2 )
      return size
    } else if indexPath.section == 1{
      let size = CGFloat( ( Int(self.tableView.frame.maxY) / 4) * 3 )
      return size
      
    } else {
      return UITableView.automaticDimension
    }
  }
  
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 4
    } else {
      return itemDeTalier.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //MARK: Section1 - 상품 정보 Custom Cell.
    if indexPath.section == 0 {
      //MARK: 상품 이미지
      switch indexPath.row {
      case 0 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollViewImageCell", for: indexPath) as! ScrollViewImageCell
        cell.configure(with: itemThumbnail)
        return cell
        
      //MARK: 상품명 가격 정보
      case 1 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleCell", for: indexPath) as! ItemTitleCell
        
        
        let company = itemValue?.company ?? ""
        let title = itemValue?.itemName ?? ""
        let subtile = itemValue?.description.addedWords ?? ""
        let discountRate = itemValue?.discountRate ?? 0.0
        let saleMoney = itemValue?.salePrice ?? 0
        let originMoney = itemValue?.originPrice ?? 0
        let cencelString =  NSMutableAttributedString(string: "\(originMoney)")
        cencelString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                  value: NSUnderlineStyle.single.rawValue,
                                  range: NSMakeRange(0, cencelString.length))
        switch discountRate {
        case 0.05:
          cell.disCount.text = " 5%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        case 0.1:
          cell.disCount.text = "10%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        case 0.2:
          cell.disCount.text = "20%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        case 0.25:
          cell.disCount.text = "25%"
          cell.disCount.textColor = #colorLiteral(red: 0.1637313068, green: 0.7520731688, blue: 0.7333211303, alpha: 1)
        default:
          cell.disCount.text = ""
          cell.disCount.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
          break
        }
        cell.title.text = "[\(company)] \(title)"
        cell.subTitle.text = subtile
        cell.salePrice.text = String(saleMoney)
        cell.originPrice.attributedText = cencelString
        return cell
        
      //MARK: 배송타입
      case 2 :
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDeliveryCell", for: indexPath) as! ItemDeliveryCell
        
        //MARK: 짤리는거는 나중에
        cell.deliveryType.text = itemValue?.description.deliveryType
        cell.getItemDay.text = itemValue?.description.receiveDay
        
        let rule = itemValue?.description.regularDelivery ?? false
        var ruleText = "정기배송"
        if rule {
          ruleText = "가능"
        } else {
          ruleText = "불가능"
        }
        cell.deliveryRule.text = ruleText
        return cell
        
      //MARK: 다른상품
      case 3 :
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "OtherItemCell", for: indexPath) as! OtherItemCell
        return cell
        
      default:
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
      }
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailCell", for: indexPath) as! ItemDetailCell
      let tempUrl = itemDeTalier[indexPath.row] 
      
      requestImage.imageData(url: tempUrl) { (data) in
        cell.detailImage.image = UIImage(data : data)
      }
      return cell
    }
    
  }
  
  //MARK: section idx0, row0
  func reload() {
    print("1111")
    self.tableView.reloadData()
  }
}

extension ItemViewController: UITableViewDelegate {
  
}
