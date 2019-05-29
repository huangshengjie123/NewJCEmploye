//
//  JCRequest_searchPurchasersAsDis.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchPurchasersAsDis.h"

@implementation JCRequest_searchPurchasersAsDis


// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/searchPurchasersAsDis.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
