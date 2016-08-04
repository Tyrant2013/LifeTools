//
//  LTKCookAPIManager.m
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/2.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import "LTKCookAPIManager.h"

@implementation LTKCookAPIManager

- (void)loadCookAllCategoriesWithCompletion:(void (^)(LTKCookResult *))completion {
    [MobAPI sendRequest:[MOBACookRequest categoryRequest]
               onResult:^(MOBAResponse *response) {
                   if (completion) {
                       LTKCookResult *result = [self resultWithResponse:response];
                       completion(result);
                   }
               }];
}

- (void)loadCookMenuByCategoryId:(NSString * _Nonnull)ctgId
                            page:(NSUInteger)page
                            size:(NSUInteger)size
                      completion:(void (^)(LTKCategoryResult * _Nonnull))completion {
    MOBACookRequest *request = [MOBACookRequest searchMenuRequestByCid:ctgId name:nil page:page size:size];
    [MobAPI sendRequest:request onResult:^(MOBAResponse *response) {
        if (completion) {
            if (!response.error) {
                NSString *JSONString = [MOBFJson jsonStringFromObject:response.responder];
                LTKCategoryResult *result = [LTKCategoryResult yy_modelWithJSON:JSONString];
                completion(result);
            }
            else {
                NSLog(@"%@", response.error);
                completion([[LTKCategoryResult alloc] init]);
            }
        }
    }];
}

- (LTKCookResult *)resultWithResponse:(MOBAResponse *)response {
    NSString *logContent = nil;
    if (response.error) {
        logContent = [NSString stringWithFormat:@"request error!\n%@", response.error];
        return [[LTKCookResult alloc] init];
    }
    else {
        NSString *JSONString = [MOBFJson jsonStringFromObject:response.responder];
        LTKCookResult *result = [LTKCookResult yy_modelWithJSON:JSONString];
        return result;
    }
}

@end
