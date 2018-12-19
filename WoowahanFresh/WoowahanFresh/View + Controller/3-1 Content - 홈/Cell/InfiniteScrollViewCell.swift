//
//  InfiniteScrollViewCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 03/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

import Alamofire
import RealmSwift

class InfiniteScrollViewCell: UITableViewCell {
  
  let scrollView = UIScrollView()
  let uiimageView = UIImageView()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    setupUI()
  }
  
  private func setupUI() {
    scrollView.frame = self.frame
    scrollView.isPagingEnabled = true
    scrollView.delegate = self
    
    self.addSubview(scrollView)
    
    let pageImages = ["https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/sub_banner_left_01.jpg",
                      "https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/sub_banner_left_02.jpg",
                      "https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/sub_banner_left_03.jpg",
                      "https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/sub_banner_left_04.jpg",
                      "https://s3.ap-northeast-2.amazonaws.com/wps-9th-chajeehyung-practice/media/items/sub_banner_left_05.jpg"]
    
    for images in pageImages {
      addPageToScrollView(with: images)
    }
  }
  
  private func addPageToScrollView(with image: String) {
    
    let pageFrame = CGRect(
      origin: CGPoint(x: scrollView.contentSize.width, y: 0),
      size: scrollView.frame.size
    )
    requestImage(url: image) { (Data) in
      
      let imageView = UIImageView(frame: pageFrame)
      imageView.image = UIImage(data: Data)
      self.scrollView.addSubview(imageView)
    }
    
    
    scrollView.contentSize.width += self.frame.width
  }
  
  //MARK: 이미지 데이터 요청
  func requestImage(url: String, handler: @escaping (Data) -> Void) {
    Alamofire.request(url, method: .get)
      .validate()
      .responseData { (response) in
        switch response.result {
        case .success(let value):
          handler(value)
          
        case .failure(let error):
          print("error = ", error.localizedDescription)
        }
    }
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension InfiniteScrollViewCell: UIScrollViewDelegate {
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
  }
  
  // MARK: 마지막 스크롤 시
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    
    // 0 + 1
//    let page = Int(scrollView.contentOffset.x / scrollView.frame.width) + 1
//    print("[page] = ", page)
    
//    if scrollView.contentOffset.x > CGFloat(page) * scrollView.frame.width + 10 {
//      scrollView.contentOffset.x = 0
//
//    } else if scrollView.contentOffset.x < 0 {
//
//      scrollView.contentOffset.x = CGFloat(page)
//    }
  }
}



// MARK: Setup

/*
 
 
 override func setSelected(_ selected: Bool, animated: Bool) {
 super.setSelected(selected, animated: animated)
 
 // Configure the view for the selected state
 }
 
 }
 */
