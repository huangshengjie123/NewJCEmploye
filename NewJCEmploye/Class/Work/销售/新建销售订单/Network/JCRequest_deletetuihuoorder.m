//
//  JCRequest_deletetuihuoorder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/28.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_deletetuihuoorder.h"

@implementation JCRequest_deletetuihuoorder

// 接口地址
- (NSString *)apiMethodName{
    
    return @"refundment/deleteRefundmentOrder.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
