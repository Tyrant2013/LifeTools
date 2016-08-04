//
//  LTKCookCategory.h
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/2.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTKCookCategory : NSObject

@property (nonatomic, copy) NSString                        *ctgId;
@property (nonatomic, copy) NSString                        *name;
@property (nonatomic, assign) NSUInteger                    parentId;
@property (nonatomic, strong) NSArray<LTKCookCategory *>    *childs;

@end
