//
//  LTKCookRecipe.m
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "LTKCookRecipe.h"

@implementation LTKCookRecipe

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"method" : [LTKCookMethod class]
             };
}

@end
