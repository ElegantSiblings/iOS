//
//  ScrollViewImageCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 09/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

protocol ScrollViewImageCellDelegate  {
  func reload()
}

class ScrollViewImageCell: UITableViewCell {
  
  let scrollView = UIScrollView()
  var itemThumbnailImage: [String] = []
  
  var delegateScrollViewImage: ScrollViewImageCellDelegate?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupUI()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupUI()
  }
  
  private func setupUI() {
    scrollView.frame = self.frame
    scrollView.isPagingEnabled = true
    self.addSubview(scrollView)
    
    // auto layout
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    scrollView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    scrollView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    scrollView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true

  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    
    
  }
  
  
  func configure(with urls: [String]) {
    for (index, url) in urls.enumerated() {
      let imageView = UIImageView()
      scrollView.contentSize = CGSize(width: scrollView.bounds.width * CGFloat(urls.count), height: scrollView.bounds.height)
      imageView.frame.size = self.bounds.size
      imageView.frame.origin = CGPoint(x: scrollView.bounds.width * CGFloat(index), y: 0)
      imageView.contentMode = .scaleAspectFill
      self.scrollView.addSubview(imageView)
      
      requestImage.imageData(url: url, handler: { data in
        let image = UIImage(data: data)
        imageView.image = image
      })
    }
  }
  
  private func addPageToScrollView(with image: String) {
    
    let pageFrame = CGRect(
      origin: CGPoint(x: scrollView.contentSize.width, y: 0),
      size: scrollView.frame.size
    )
    let imageView = UIImageView(frame: pageFrame)
    self.scrollView.addSubview(imageView)
    scrollView.contentSize.width += self.frame.width
    
    requestImage.imageData(url: image) { (Data) in
      imageView.image = UIImage(data: Data)
    }
    
  }
  
}
