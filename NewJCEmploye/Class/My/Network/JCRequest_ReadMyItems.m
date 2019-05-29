//
//  JCRequest_ReadMyItems.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyItems.h"

@implementation JCRequest_ReadMyItems

// 接口地址
- (NSString *)apiMethodName{
    
    return @"item/getUserItemsList.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
