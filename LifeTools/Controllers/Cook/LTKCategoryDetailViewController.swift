//
//  LTKCategoryDetailViewController.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import UIKit

class LTKCategoryDetailViewController: UICollectionViewController {
    
    var dataObject = LTKCookCategory()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setData(data: LTKCookCategory) {
        self.dataObject = data
        self.title = data.name
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataObject.childs.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("LTKCategoryCell", forIndexPath: indexPath) as! LTKCategoryCell
        let item = self.dataObject.childs[indexPath.row]
        cell.title.text = item.name
        cell.content.backgroundColor = UIColor(hue: 0.27 * (CGFloat(indexPath.row) / CGFloat(self.dataObject.childs.count) - 0.02),
                                       saturation: 1,
                                       brightness: 0.9,
                                       alpha: 1)
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let manager = LTKCookAPIManager()
        let category = self.dataObject.childs[indexPath.row];
        manager.loadCookMenuByCategoryId(category.ctgId, page: 0, size: 10) { (result: LTKCategoryResult) in
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! LTKMenusViewController
        let cell = sender as! LTKCategoryCell
        let indexPath = self.collectionView?.indexPathForCell(cell)
        let category = self.dataObject.childs[(indexPath?.row)!];
        destViewController.configCategoryInfo(category)
    }
}
