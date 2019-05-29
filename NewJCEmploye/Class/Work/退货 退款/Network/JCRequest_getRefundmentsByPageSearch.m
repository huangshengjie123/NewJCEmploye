//
//  JCRequest_getRefundmentsByPageSearch.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/24.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getRefundmentsByPageSearch.h"

@implementation JCRequest_getRefundmentsByPageSearch

// 接口地址
- (NSString *)apiMethodName{
    
    return @"refundment/getRefundmentsByPageSearch.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
