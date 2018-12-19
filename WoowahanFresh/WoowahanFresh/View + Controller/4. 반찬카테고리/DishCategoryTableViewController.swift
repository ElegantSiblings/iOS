//
//  DishTableViewController.swift
//  WoowahanFresh
//
//  Created by qbbang on 07/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit
import Alamofire

class DishCategoryTableViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  //MARK: Category Detail - Item list을 담는 변수
  var ListValue: ItemList?
  //MARK: HomeTableView에서 넘어는 pk를 담는 변수
  var requestPK: String = ""
  var didSelectPk = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print("====================")
    print("DishCategoryTableViewController")
    print("====================")
    
    //MARK: TableView 설정
    tableView.delegate = self
    tableView.dataSource = self
    //MARK: TableView Cell 테두리 제거
    tableView.separatorStyle = .none
    
    //MARK: TableView CustomCell 등록
    //MARK: Section idx0
    tableView.register(UINib(nibName: "ImageViewCell", bundle: nil),
                       forCellReuseIdentifier: "ImageViewCell")
    //MARK: Section idx1
    tableView.register(UINib(nibName: "btnArrayCell", bundle: nil),
                       forCellReuseIdentifier: "btnArrayCell")
    //MARK: Section idx2
    tableView.register(UINib(nibName: "ItemCell", bundle: nil),
                       forCellReuseIdentifier: "ItemCell")
    
    tableView.register(UITableViewCell.self,
                       forCellReuseIdentifier: "Cell")
    
    //    tableView.rowHeight = UITableView.automaticDimension
    //    self.tableView.estimatedRowHeight = 150
    
    //MARK: 넘어온 pk에 따라 Category Detail - Item list API 요청
    //MARK: 콜백 처리 시, 래퍼런스 카운터가 자가참조를 함으로
    //: [weak self] 써서 비동기 호출 후 사라지도록 RC를 증가 하지 않게 해야함
    requestCategory.listInfo(pk: requestPK) { [weak self] (ItemList) in
      guard let self = self else { return }
      self.ListValue = ItemList
      self.tableView.reloadData()
    }
  }
  
  //MARK: ItemView에서 DishCategoryTable로 돌아옴
  @IBAction func unwindToDishCategory(_ unwindSegue: UIStoryboardSegue) {
    print("ItemView에서 DishCategoryTable로 돌아옴")
  }
}

//MARK: 테이블뷰 자료 표현 + ItemCell 클릭 델리게이트
extension DishCategoryTableViewController: UITableViewDataSource, btnArrayCellDelegate {
  
  //MARK: Section 개수
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  //MARK: Section의 이름
  func tableView(_ tableView: UITableView,
                 titleForHeaderInSection section: Int) -> String? {
    if section == 0 {
      return ""
    } else if section == 1 {
      return ""
    } else if section == 2 {
      return "검색 결과: \(ListValue?.itemList.count ?? 0)개 "
    } else {
      return ""
    }
  }
  
  //MARK: Cell의 갯수
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    //MARK: Section index0, 세부 카테고리
    //TODO: 세부 카테고리 항목 추가해야함.
    if section == 0 {
      return 1
    } else if section == 1 {
      return 1
      //MARK: Section index2, Item List 뿌려줌
    } else if section == 2 {
      guard let cellCount = ListValue?.itemList.count else { return 0 }
      return cellCount
    } else {
      return 1
    }
  }
  
  //MARK: TableView Cell의 표현
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    //MARK: Section idx0, 배너이미지
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath) as! ImageViewCell
      let tempBanner = ListValue?.currentCategories.photo ?? "nil"
      requestImage.imageData(url: tempBanner) { (Data) in
        cell.bannerImage.image = UIImage(data: Data)
      }
      return cell
      
      //MARK: Section idx1, 버튼 카테고리
    } else if indexPath.section == 1 {
      let cell = tableView.dequeueReusableCell(withIdentifier: "btnArrayCell", for: indexPath) as! btnArrayCell
      
      //MARK: btnArray 델리게이트 설정
      cell.delegateBtn = self
      let count = ListValue?.subCategories.count ?? 0
      //MARK: 개수에 따른 UI조작
      switch count {
      case 4: cell.btnTwoList.setTitle(ListValue?.subCategories[1].subCategory, for: .normal)
        cell.btnThreeList.setTitle(ListValue?.subCategories[2].subCategory, for: .normal)
        cell.btnFourList.setTitle(ListValue?.subCategories[3].subCategory, for: .normal)
        cell.btnFiveList.alpha = 0
        cell.btnSixList.alpha = 0
      case 5:
        cell.btnTwoList.setTitle(ListValue?.subCategories[1].subCategory, for: .normal)
        cell.btnThreeList.setTitle(ListValue?.subCategories[2].subCategory, for: .normal)
        cell.btnFourList.setTitle(ListValue?.subCategories[3].subCategory, for: .normal)
        cell.btnFiveList.setTitle(ListValue?.subCategories[4].subCategory, for: .normal)
        cell.btnSixList.alpha = 0
      case 6:
        cell.btnTwoList.setTitle(ListValue?.subCategories[1].subCategory, for: .normal)
        cell.btnThreeList.setTitle(ListValue?.subCategories[2].subCategory, for: .normal)
        cell.btnFourList.setTitle(ListValue?.subCategories[3].subCategory, for: .normal)
        cell.btnFiveList.setTitle(ListValue?.subCategories[4].subCategory, for: .normal)
        cell.btnSixList.setTitle(ListValue?.subCategories[5].subCategory, for: .normal)
      case 7:
        cell.btnTwoList.setTitle(ListValue?.subCategories[1].subCategory, for: .normal)
        cell.btnThreeList.setTitle(ListValue?.subCategories[2].subCategory, for: .normal)
        cell.btnFourList.setTitle(ListValue?.subCategories[3].subCategory, for: .normal)
        cell.btnFiveList.setTitle(ListValue?.subCategories[4].subCategory, for: .normal)
        cell.btnSixList.setTitle(ListValue?.subCategories[5].subCategory, for: .normal)
        cell.btnSevenList.alpha = 1
        cell.btnSevenList.setTitle(ListValue?.subCategories[6].subCategory, for: .normal)
      default :
        break
      }
      
      //      cell.textLabel?.text = "\(count)"
      //      cell.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
      return cell
      
      //MARK: Section idx2, CustomCell - ItemCell
    } else if indexPath.section == 2 {
      
      let tempPk = ListValue?.itemList[indexPath.row].pk ?? 0
      let tempComany = ListValue?.itemList[indexPath.row].company ?? "nil"
      let tempItemName = ListValue?.itemList[indexPath.row].itemName ?? "nil"
      let tempSalePrice = ListValue?.itemList[indexPath.row].salePrice ?? 0
      let tempOriginPrice = ListValue?.itemList[indexPath.row].originPrice ?? 0
      let cencelString =  NSMutableAttributedString(string: "\(tempOriginPrice)")
      cencelString.addAttribute(NSAttributedString.Key.strikethroughStyle,
                                value: NSUnderlineStyle.single.rawValue,
                                range: NSMakeRange(0, cencelString.length))
      let tempDiscount = ListValue?.itemList[indexPath.row].discountRate ?? 0.0
      let inputUrl = ListValue?.itemList[indexPath.row].listThumbnail ?? "nil"
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
      //MARK: ItemCell 델리게이트
      cell.delegate = self
      
      //MARK: Item pk
      cell.itemPkNumber = tempPk
      //MARK: Item 제목 회사 + 아이템 이름
      cell.titel.text = "<\(tempPk)>[\(tempComany)] \(tempItemName)"
      
      //MARK: Item 세일가격
      cell.salePrice.text = String(tempSalePrice)
      
      //MARK: Item 원래 가격
      cell.originPrice.attributedText = cencelString
      
      //MARK: Item discount
      switch tempDiscount {
      case 0:
        break
      case 0.05:
        cell.discountRate.text = "5%"
        cell.discountRate.backgroundColor = #colorLiteral(red: 0.8940796256, green: 0.3990336657, blue: 0.386872828, alpha: 1)
        
      case 0.1:
        cell.discountRate.text = "10%"
        cell.discountRate.backgroundColor = #colorLiteral(red: 0.8940796256, green: 0.3990336657, blue: 0.386872828, alpha: 1)
        
      case 0.25:
        cell.discountRate.text = "25%"
        cell.discountRate.backgroundColor = #colorLiteral(red: 0.8940796256, green: 0.3990336657, blue: 0.386872828, alpha: 1)
      default:
        break
      }
      
      //MARK: Item Thumbnail
      requestImage.imageData(url: inputUrl) { (Data) in
        cell.listThumbnail.image = UIImage(data: Data)
      }
      
      return cell
      
      //MARK: 그 외 케이스 없음
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      cell.textLabel?.text = "나올수 없음"
      cell.backgroundColor = .black
      return cell
    }
  }
  
  
  //  MARK: tableView 높이
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    
    switch indexPath.section {
    case 0 :
      let size = CGFloat( (( Int(self.view.frame.maxY) / 5) * 1) - 50 )
      return size
      
    case 1 :
      let count = ListValue?.subCategories.count ?? 0
      if count < 7 {
        return 86
      } else {
        return 130
      }
      
    case 2 :
      let size = CGFloat( ( Int(self.view.frame.maxY) / 5) * 2 )
      return size
      
    default:
      return 315
    }
  }
  
  //MARK: section idx1 btnArray 델리게이크 기능들
  func DidTabbtnAllList() {
    let subPk = String(ListValue?.subCategories[0].pk ?? 0)
    ListValue = nil
    requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
      guard let self = self else { return }
      self.ListValue = ItemList
      self.tableView.reloadData()
    }
  }
  
  func DidTabbtnTwoList() {
    let subPk = String(ListValue?.subCategories[1].pk ?? 0)
    ListValue = nil
    requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
      guard let self = self else { return }
      self.ListValue = ItemList
      self.tableView.reloadData()
    }
  }
  
  func DidTabbtnThreeList() {
    let subPk = String(ListValue?.subCategories[2].pk ?? 0)
    ListValue = nil
    requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
      guard let self = self else { return }
      self.ListValue = ItemList
      self.tableView.reloadData()
    }
  }
  
  func DidTabbtnFourList() {
    let subPk = String(ListValue?.subCategories[3].pk ?? 0)
    ListValue = nil
    requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
      guard let self = self else { return }
      self.ListValue = ItemList
      self.tableView.reloadData()
    }
  }
  
  func DidTabbtnFiveList() {
    let count = ListValue?.subCategories.count ?? 0
    if count < 5 {
      print("눌리면 에러?")
    } else {
      
      let subPk = String(ListValue?.subCategories[4].pk ?? 0)
      ListValue = nil
      requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
        guard let self = self else { return }
        self.ListValue = ItemList
        self.tableView.reloadData()
      }
    }
  }
  
  func DidTabbtnSixList() {
    let count = ListValue?.subCategories.count ?? 0
    if count < 6 {
      print("눌리면 에러?")
    } else {
      
      let subPk = String(ListValue?.subCategories[5].pk ?? 0)
      ListValue = nil
      requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
        guard let self = self else { return }
        self.ListValue = ItemList
        self.tableView.reloadData()
      }
    }
  }
  
  func DidTabbtnSevenList() {
    let count = ListValue?.subCategories.count ?? 0
    if count < 7 {
      print("눌리면 에러?")
    } else {
      
      let subPk = String(ListValue?.subCategories[6].pk ?? 0)
      ListValue = nil
      requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
        guard let self = self else { return }
        self.ListValue = ItemList
        self.tableView.reloadData()
      }
    }
  }
  
  func DidTabbtnEightList() {
    let count = ListValue?.subCategories.count ?? 0
    if count < 8 {
      print("눌리면 에러?")
    } else {
      
      let subPk = String(ListValue?.subCategories[7].pk ?? 0)
      ListValue = nil
      requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
        guard let self = self else { return }
        self.ListValue = ItemList
        self.tableView.reloadData()
      }
    }
  }
  
  func DidTabbtnNineList() {
    let count = ListValue?.subCategories.count ?? 0
    if count < 9 {
      print("눌리면 에러?")
    } else {
      
      let subPk = String(ListValue?.subCategories[8].pk ?? 0)
      ListValue = nil
      requestCategory.listInfo(pk: subPk) { [weak self] (ItemList) in
        guard let self = self else { return }
        self.ListValue = ItemList
        self.tableView.reloadData()
      }
    }
  }
}

extension DishCategoryTableViewController: UITableViewDelegate, ItemCellDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if indexPath.section == 2 {
      //MARK: 네비게이션 바가 있는 스토리보드 데이터 전송
      let storyboard = UIStoryboard(name: "Item", bundle: nil)
      let ItemVC = storyboard.instantiateViewController(withIdentifier: "ItemViewController") as! ItemViewController
      self.didSelectPk = ListValue?.itemList[indexPath.row].pk ?? 0000
      print("didSelect: ", didSelectPk)
      
      ItemVC.itemPk = String(didSelectPk)
      navigationController?.pushViewController(ItemVC, animated: true)
    }
  }
  
  //MARK: section idx2 itemCell 델리게이트 기능들
  
  func DidTabHeart() {
    print("heart")
  }
  
  //TODO: 셀을 이전에 클릭하면 pk값을 알수 없음
  func DidTabShopping() {
    if SingleUserInfo.sharedInstance.token.isEmpty {
      Alert.loginCheck(viewController: self)
    } else {
      let tempDidSelectpk = String(didSelectPk)
      requestCart.addItem(item_pk: tempDidSelectpk)
      Alert.addItem(viewController: self)
    }
  }
}



