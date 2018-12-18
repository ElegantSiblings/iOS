//
//  ScrollViewImageCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

import RealmSwift

class ScrollViewImageCell: UITableViewCell {
  
  @IBOutlet weak var backScrollView: UIScrollView!
  @IBOutlet weak var thumbnailImage: UIImageView!
  
//  let scrollView = UIScrollView()
//  let uiimageView = UIImageView()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
    //setupUI()
    
    thumbnailImage.translatesAutoresizingMaskIntoConstraints = false
    thumbnailImage.contentMode = .scaleAspectFill
    thumbnailImage.clipsToBounds = true
    
  }
  
//  private func setupUI() {
//    backScrollView.frame = self.frame
//    backScrollView.isPagingEnabled = true
//    backScrollView.delegate = self
//
////    self.addSubview(scrollView)
//
//    let pageImages = [String]()
//
//    for images in pageImages {
//      addPageToScrollView(with: images)
//    }
//  }
//
//  private func addPageToScrollView(with image: String) {
//
//    let pageFrame = CGRect(
//      origin: CGPoint(x: backScrollView.contentSize.width, y: 0),
//      size: thumbnailImage.frame.size//scrollView.frame.size
//    )
//
//    let imageView = UIImageView(frame: pageFrame)
//    imageView.image = UIImage(named: image)
//
//    backScrollView.addSubview(imageView)
//
//    backScrollView.contentSize.width += 300//thumbnailImage.frame.width
//  }
//
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}

extension ScrollViewImageCell: UIScrollViewDelegate {
  
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
