//
//  InfiniteScrollViewTableViewCell.swift
//  WoowahanFresh
//
//  Created by qbbang on 02/12/2018.
//  Copyright © 2018 qbbang. All rights reserved.
//

import UIKit

class InfiniteScrollView: UITableViewCell {

//  let contentView: UIContentContainer
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      print(self.reuseIdentifier)
      
      self.backgroundColor = #colorLiteral(red: 0.2470588237, green: 0.3882353008, blue: 0.5450980663, alpha: 1)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
      print("push btn")
    }

}
