//
//  LTKWaterFlowLayout.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import Foundation

class LTKWaterFlowLayout: UICollectionViewFlowLayout {
    let LTKDefaultRowMargin = 10.0
    let LTKDefaultColumnMargin = 10.0
    let LTKDefaultInsets = UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
    let LTKDefaultColumnsCount = 2
    var columnMaxYs = [CGFloat]()
    var columnHeights = [Double]()
    var attrsArray = [UICollectionViewLayoutAttributes]()
    var contentSize = CGSizeZero
    
    override func collectionViewContentSize() -> CGSize {
        return self.contentSize
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        self.columnMaxYs.removeAll()
        for _ in 0...self.LTKDefaultColumnsCount {
            self.columnMaxYs.append(self.LTKDefaultInsets.top)
        }
        
        self.attrsArray.removeAll()
        self.columnHeights.removeAll()
        let count = self.collectionView?.numberOfItemsInSection(0)
        
        if let total = count {
            if (total == 0) {
                return
            }
            for _ in 0...total - 1 {
                self.columnHeights.append(0.0)
            }
            
            for index in 0...total - 1 {
                let indexPath = NSIndexPath(forItem: index, inSection: 0)
                if let attr = self.layoutAttributesForItemAtIndexPath(indexPath) {
                    self.attrsArray.append(attr)
                }
            }
        }
        
        var totalHeight = [Double]()
        for _ in 0...self.LTKDefaultColumnsCount - 1 {
            totalHeight.append(0.0)
        }
        for itemIndex in 0...self.columnHeights.count - 1 {
            let height = self.columnHeights[itemIndex]
            let sameColIndex = itemIndex % self.LTKDefaultColumnsCount
            totalHeight[sameColIndex] += height + Double(self.LTKDefaultInsets.top)
        }
        let maxHeight = totalHeight.maxElement()! + Double(self.LTKDefaultInsets.bottom)
        self.contentSize = CGSize(width: 0, height: maxHeight)
        self.makeupLastItemsHeight(maxHeight, heights: totalHeight)
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        return self.attrsArray
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes? {
        let attrs = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        let collectionWidth = Double(CGRectGetWidth((self.collectionView?.bounds)!))
        let xMargin = Double(self.LTKDefaultInsets.left + self.LTKDefaultInsets.right) + Double(self.LTKDefaultColumnsCount - 1) * self.LTKDefaultColumnMargin
        let width = (collectionWidth - xMargin) / Double(self.LTKDefaultColumnsCount)
        let height = 150.0 + Double(arc4random_uniform(100));
        let currentColumn = indexPath.row % self.LTKDefaultColumnsCount
        let hasLoadedRow = indexPath.row / self.LTKDefaultColumnsCount
        var hasLoadedHeight = 0.0
        if hasLoadedRow >= 1 {
            for index in 0...hasLoadedRow - 1 {
                let itemIndex = currentColumn + self.LTKDefaultColumnsCount * index
                hasLoadedHeight += self.columnHeights[itemIndex] + Double(self.LTKDefaultInsets.top)
            }
        }
        
        let posX = Double(self.LTKDefaultInsets.left) + Double(indexPath.row % self.LTKDefaultColumnsCount) * (width + self.LTKDefaultColumnMargin)
        let posY = hasLoadedHeight + Double(self.LTKDefaultInsets.top)
        attrs.frame = CGRect(x: posX, y: posY, width: width, height: height)
        self.columnHeights[indexPath.row] = height
        return attrs
    }
    
    /// 补齐最后几个items的高度，让最后一行平等
    func makeupLastItemsHeight(maxHeight:Double, heights:[Double]) -> Void {
        let deliverHeights = heights.map { (height: Double) -> Double in
            return maxHeight - Double(self.LTKDefaultInsets.bottom) - height
        }
        for index in 0...self.LTKDefaultColumnsCount - 1 {
            let itemIndex = self.columnHeights.count - (self.LTKDefaultColumnsCount - index)
            let attr = self.attrsArray[itemIndex]
            let totalHeightIndex = itemIndex % self.LTKDefaultColumnsCount
            attr.frame.size.height += CGFloat(deliverHeights[totalHeightIndex])
        }
    }
}
