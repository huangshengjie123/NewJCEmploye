//
//  JCRequest_searchPurchaserOrders.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/31.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchPurchaserOrders.h"

@implementation JCRequest_searchPurchaserOrders


// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/searchPurchaserOrders.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
