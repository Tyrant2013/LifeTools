//
//  LTKStepViewController.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/4.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import UIKit

class LTKStepViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView?
    @IBOutlet var descLabel: UILabel?
    
    @IBOutlet var imageWidth: NSLayoutConstraint?
    @IBOutlet var imageHeight: NSLayoutConstraint?
    
    var step = LTKCookMethod()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let img = self.step.img {
            self.imageView?.sd_setImageWithURL(NSURL(string: img))
            self.imageView?.sd_setImageWithURL(NSURL(string: img), completed: { (image: UIImage!, error: NSError!, type: SDImageCacheType, URL: NSURL!) in
                self.imageWidth?.constant = min(image.size.width, 300.0)
                let ratio = image.size.width / image.size.height
                self.imageHeight?.constant = self.imageWidth!.constant / ratio
            })
        }
        self.descLabel?.text = self.step.step
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configStep(step: LTKCookMethod, stepNum: String!) -> Void {
        self.step = step
        self.title = "Step \(stepNum)"
    }

}
