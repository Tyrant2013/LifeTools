//
//  ViewController.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/2.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var leftSize:CGSize
    var rightSize:CGSize
    var showLeft = true
    var dataSource = [LTKCookCategory]()
    
    required init?(coder aDecoder: NSCoder) {
        
        let screenWidth = UIScreen.mainScreen().bounds.size.width
        self.leftSize = CGSizeMake(screenWidth / 2, 300);
        self.rightSize = CGSizeMake(screenWidth / 2, 200);
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let item = LTKCookAPIManager()
        item.loadCookAllCategoriesWithCompletion({(result:LTKCookResult!) -> () in
            if let rr = result.result {
                self.title = rr.name
                if let childs = rr.childs {
                    for child in childs {
                        self.dataSource.append(child)
                    }
                    self.collectionView?.reloadData()
                }
            }
            
        })
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CategoryCell", forIndexPath: indexPath) as! LTKCategoryCell
        cell.content.backgroundColor = UIColor.init(hue: 0.27 * (CGFloat(indexPath.row) / CGFloat(self.dataSource.count) - 0.02), saturation: 1, brightness: 0.9, alpha: 1)
        let item = self.dataSource[indexPath.row]
        cell.title.text = item.name
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! LTKCategoryDetailViewController
        let cell = sender as! LTKCategoryCell
        let indexPath = self.collectionView?.indexPathForCell(cell)
        let category = self.dataSource[(indexPath?.row)!];
        destViewController.setData(category)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

