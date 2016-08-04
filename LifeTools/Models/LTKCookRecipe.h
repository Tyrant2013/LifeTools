//
//  LTKCookRecipe.h
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTKCookMethod.h"

@interface LTKCookRecipe : NSObject

@property (nonatomic, copy) NSString                        *img;
@property (nonatomic, copy) NSArray<LTKCookMethod *>        *method;
@property (nonatomic, copy) NSString                        *ingredients;
@property (nonatomic, copy) NSString                        *title;
@property (nonatomic, copy) NSString                        *sumary;

@end
