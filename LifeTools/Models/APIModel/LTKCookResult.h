//
//  LTKCookResult.h
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/2.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel/YYModel.h>
#import "LTKCookCategory.h"
#import "LTKAPIResponse.h"

@interface LTKCookResult : LTKAPIResponse

/// 200成功
@property (nonatomic, assign) NSInteger                     retCode;
@property (nonatomic, copy) NSString                        *msg;
@property (nonatomic, strong) LTKCookCategory               *result;

@end
