//
//  APIResponse.m
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "LTKAPIResponse.h"

@implementation LTKAPIResponse

+ (NSArray *)modelPropertyBlacklist {
    return @[@"status", @"errorDescription", @"error"];
}

- (instancetype)initWithStatus:(NSInteger)status msg:(NSString *)msg error:(NSError *)error {
    if (self = [super init]) {
        _status = status;
        _errorDescription = msg;
        _error = error;
    }
    return self;
}

@end
