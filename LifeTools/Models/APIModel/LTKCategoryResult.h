//
//  LTKCategoryResult.h
//  LifeTools
//
//  Created by 庄晓伟 on 16/8/3.
//  Copyright © 2016年 Zhuang Xiaowei. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <YYModel/YYModel.h>
#import "LTKCookMenu.h"
#import "LTKAPIResponse.h"

///
///  查询菜谱结果
///

@interface LTKCategoryResult : LTKAPIResponse

@property (nonatomic, assign) NSUInteger                    curPage;
@property (nonatomic, assign) NSUInteger                    total;
@property (nonatomic, copy) NSArray<LTKCookMenu *>          *list;

@end
