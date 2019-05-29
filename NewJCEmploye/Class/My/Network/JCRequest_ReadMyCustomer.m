//
//  JCRequest_ReadMyCustomer.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyCustomer.h"

@implementation JCRequest_ReadMyCustomer

// 接口地址
- (NSString *)apiMethodName{
    
    return @"customer/getCustomerByParams.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
