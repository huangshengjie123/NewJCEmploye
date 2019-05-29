//
//  JCRequest_readRefundData.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/30.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readRefundData.h"

@implementation JCRequest_readRefundData

// 接口地址
- (NSString *)apiMethodName{
    
    return @"refundment/getComRefundmentsByPageSearch.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
