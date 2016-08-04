//
//  LTKRecipeStepCell.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/4.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import UIKit

class LTKRecipeStepCell: UITableViewCell {
    
    @IBOutlet var content: UIView!
    @IBOutlet var stepNumLabel: UILabel!
    @IBOutlet var stepDescLabel: UILabel!
    @IBOutlet var stepImgView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.__loadContentView()
        self.stepNumLabel.layer.cornerRadius = 17.5
        self.content.layer.cornerRadius = 10.0
        self.content.layer.borderWidth = 1.0
        self.content.layer.borderColor = UIColor.grayColor().CGColor
        self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func __loadContentView() -> Void {
        NSBundle.mainBundle().loadNibNamed("LTKRecipeStepCell", owner: self, options: nil)
        self.contentView.addSubview(self.content)
        let leading = NSLayoutConstraint(item: self.content, attribute: .Leading, relatedBy: .Equal, toItem: self.contentView, attribute: .Leading, multiplier: 1.0, constant: 10.0)
        let trail = NSLayoutConstraint(item: self.content, attribute: .Trailing, relatedBy: .Equal, toItem: self.contentView, attribute: .Trailing, multiplier: 1.0, constant: -10.0)
        let top = NSLayoutConstraint(item: self.content, attribute: .Top, relatedBy: .Equal, toItem: self.contentView, attribute: .Top, multiplier: 1.0, constant: 5.0)
        let bottom = NSLayoutConstraint(item: self.content, attribute: .Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1.0, constant: -5.0)
        let height = NSLayoutConstraint(item: self.content, attribute: .Height, relatedBy: .GreaterThanOrEqual, toItem: nil, attribute: .NotAnAttribute, multiplier: 1.0, constant: 140.0)
        self.content.translatesAutoresizingMaskIntoConstraints = false;
        self.content.addConstraint(height)
        self.contentView.addConstraints([top, leading, bottom, trail])
    }

}
