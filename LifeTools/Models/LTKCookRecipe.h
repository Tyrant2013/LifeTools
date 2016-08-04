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

@property (nonatomic, copy, nullable) NSString                  *img;
@property (nonatomic, copy, nullable) NSArray<LTKCookMethod *>  *method;
@property (nonatomic, copy, nullable) NSString                  *ingredients;
@property (nonatomic, copy, nullable) NSString                  *title;
@property (nonatomic, copy, nullable) NSString                  *sumary;

@end
