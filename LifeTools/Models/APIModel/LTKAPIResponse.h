//
//  APIResponse.h
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTKAPIResponse : NSObject

@property (nonatomic, assign) NSInteger                     status;
@property (nonatomic, copy) NSString                        *errorDescription;
@property (nonatomic, strong) NSError                       *error;

- (instancetype)initWithStatus:(NSInteger)status msg:(NSString *)msg error:(NSError *)error;

@end
