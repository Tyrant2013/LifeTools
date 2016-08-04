//
//  LTKRecipeViewController.swift
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/4.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

import UIKit
import WebImage

private let reusableIdentifier = "LTKRecipeStepCell"

class LTKRecipeViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView?
    
    var recipeData = LTKCookRecipe()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView?.estimatedRowHeight = 140.0
        self.tableView?.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configRecipeData(data: LTKCookRecipe) -> Void {
        self.recipeData = data
        self.title = data.title
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destViewController = segue.destinationViewController as! LTKStepViewController
        let cell = sender as! LTKRecipeStepCell
        if let indexPath = self.tableView?.indexPathForCell(cell) {
            let step = self.recipeData.method![indexPath.row]
            destViewController.configStep(step, stepNum: String(indexPath.row + 1))
        }
    }

    // MARK: UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let methods = self.recipeData.method {
            return methods.count
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reusableIdentifier, forIndexPath: indexPath) as! LTKRecipeStepCell
        let step = self.recipeData.method![indexPath.row];
        cell.stepNumLabel.text = String(indexPath.row + 1)
        cell.stepDescLabel.text = step.step
        if let img = step.img {
            cell.stepImgView.sd_setImageWithURL(NSURL(string: img))
        }
        return cell
    }
    
}
