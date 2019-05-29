//
//  JCRequest_getCustomerByCusId.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/18.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getCustomerByCusId.h"

@implementation JCRequest_getCustomerByCusId

//接口地址
- (NSString *)apiMethodName{
    
    return @"customer/getCustomerByCusId.do";
}

//请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
