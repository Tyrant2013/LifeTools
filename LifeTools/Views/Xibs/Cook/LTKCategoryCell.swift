//
//  LTKCategoryCell.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import Foundation

class LTKCategoryCell: UICollectionViewCell {
    @IBOutlet var content: UIView!
    @IBOutlet var title: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.__loadContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        self.__loadContentView()
    }
    
    func __loadContentView() {
        NSBundle.mainBundle().loadNibNamed("LTKCotegoryCell", owner: self, options: nil)
        self.contentView.addSubview(self.content)
        let leading = NSLayoutConstraint(item: self.content, attribute: .Leading, relatedBy: .Equal, toItem: self.contentView, attribute: .Leading, multiplier: 1.0, constant: 0.0)
        let trail = NSLayoutConstraint(item: self.content, attribute: .Trailing, relatedBy: .Equal, toItem: self.contentView, attribute: .Trailing, multiplier: 1.0, constant: 0.0)
        let top = NSLayoutConstraint(item: self.content, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top, multiplier: 1.0, constant: 0.0)
        let bottom = NSLayoutConstraint(item: self.content, attribute: .Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.content.translatesAutoresizingMaskIntoConstraints = false;
        self.contentView.addConstraints([top, leading, bottom, trail])
    }
}
