//
//  JCRequest_readmoreMycustomer.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/30.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readmoreMycustomer.h"

@implementation JCRequest_readmoreMycustomer
// 接口地址
- (NSString *)apiMethodName{
    
    
    return @"customer/getCustomerAndWaterCardByParamsWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    
    return LCRequestMethodGet;
}

@end
