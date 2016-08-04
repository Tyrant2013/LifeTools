//
//  LTKCookMenu.h
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTKCookRecipe.h"

@interface LTKCookMenu : NSObject

@property (nonatomic, copy) NSArray<NSString *>             *ctgIds;
@property (nonatomic, copy) NSString                        *ctgTitles;
@property (nonatomic, strong) LTKCookRecipe                 *recipe;
@property (nonatomic, copy) NSString                        *menuId;
@property (nonatomic, copy) NSString                        *name;
@property (nonatomic, copy) NSString                        *thumbnail;

@end
