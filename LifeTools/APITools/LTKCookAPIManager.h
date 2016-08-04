//
//  LTKCookAPIManager.h
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/2.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LTKAPIManager.h"
#import "LTKCookResult.h"
#import "LTKCategoryResult.h"

@interface LTKCookAPIManager : LTKAPIManager

- (void)loadCookAllCategoriesWithCompletion:(void (^_Nonnull)(LTKCookResult * _Nonnull result))completion;
- (void)loadCookMenuByCategoryId:(NSString * _Nonnull)ctgId
                            page:(NSUInteger)page
                            size:(NSUInteger)size
                      completion:(void (^_Nonnull)(LTKCategoryResult * _Nonnull result))completion;

@end
