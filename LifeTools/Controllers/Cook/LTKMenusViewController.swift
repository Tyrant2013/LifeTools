//
//  LTKMenusViewController.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import UIKit
import WebImage

private let reuseIdentifier = "LTKMenuCell"

class LTKMenusViewController: UICollectionViewController {
    var appearOnce = false
    var dataSource = [LTKCookMenu]()
    let manager = LTKCookAPIManager()
    var categoryInfo = LTKCookCategory()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.clearsSelectionOnViewWillAppear = false
        let layout = self.collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        let width = CGRectGetWidth(UIScreen.mainScreen().bounds)
        let itemWidth = (width - layout.minimumLineSpacing - layout.sectionInset.left - layout.sectionInset.right) / 2.0
        layout.itemSize = CGSize(width: itemWidth, height: 150.0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if !self.appearOnce {
            self.appearOnce = true
            self.manager.loadCookMenuByCategoryId(self.categoryInfo.ctgId, page: 0, size: 10, completion: { (result: LTKCategoryResult) in
                self.dataSource.appendContentsOf(result.list)
                self.collectionView?.reloadData()
            })
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! LTKRecipeViewController
        let cell = sender as! LTKMenuCell
        if let indexPath = self.collectionView?.indexPathForCell(cell) {
            let menu = self.dataSource[indexPath.row]
            destViewController.configRecipeData(menu.recipe)
        }
    }

    // MARK: UICollectionViewDataSource


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataSource.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as!  LTKMenuCell
        let item = self.dataSource[indexPath.row]
        cell.title?.text = item.name
        if let img = item.thumbnail {
            cell.imageView?.sd_setImageWithURL(NSURL(string: img))
        }
        return cell
    }
    
    func configCategoryInfo(category: LTKCookCategory) -> Void {
        self.categoryInfo = category
        self.title = category.name
    }

}
