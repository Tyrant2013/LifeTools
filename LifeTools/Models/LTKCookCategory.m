//
//  LTKCookCategory.m
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/2.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "LTKCookCategory.h"

@implementation LTKCookCategory

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"name" : @"categoryInfo.name",
             @"parentId" : @"categoryInfo.parentId",
             @"ctgId" : @"categoryInfo.ctgId"
             };
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"childs" : [LTKCookCategory class]
             };
}

@end
