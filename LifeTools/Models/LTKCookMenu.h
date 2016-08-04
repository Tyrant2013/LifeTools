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

@property (nonatomic, copy, nonnull) NSArray<NSString *>    *ctgIds;
@property (nonatomic, copy, nonnull) NSString               *ctgTitles;
@property (nonatomic, strong, nonnull) LTKCookRecipe        *recipe;
@property (nonatomic, copy, nonnull) NSString               *menuId;
@property (nonatomic, copy, nonnull) NSString               *name;
@property (nonatomic, copy, nullable) NSString              *thumbnail;

@end
