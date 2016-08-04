//
//  LTKMenuCell.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import UIKit

class LTKMenuCell: UICollectionViewCell {
    @IBOutlet var content: UIView!
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var title: UILabel?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.__loadContentView()
    }
    
    func __loadContentView() -> Void {
        NSBundle.mainBundle().loadNibNamed("LTKMenuCell", owner: self, options: nil)
        self.contentView.addSubview(self.content!)
        let leading = NSLayoutConstraint(item: self.content, attribute: .Leading, relatedBy: .Equal, toItem: self.contentView, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let trail = NSLayoutConstraint(item: self.content, attribute: .Trailing, relatedBy: .Equal, toItem: self.contentView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        let top = NSLayoutConstraint(item: self.content, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self.content, attribute: .Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.content.translatesAutoresizingMaskIntoConstraints = false;
        self.contentView.addConstraints([top, leading, bottom, trail])
    }
}
