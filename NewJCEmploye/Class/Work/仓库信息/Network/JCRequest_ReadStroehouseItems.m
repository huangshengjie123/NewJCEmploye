//
//  JCRequest_ReadStroehouseItems.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/15.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadStroehouseItems.h"

@implementation JCRequest_ReadStroehouseItems

// 接口地址
- (NSString *)apiMethodName{
    
    return @"storeHouse/getStoreItemsList.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
