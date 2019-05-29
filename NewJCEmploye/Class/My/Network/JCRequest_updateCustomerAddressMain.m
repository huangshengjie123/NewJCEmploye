//
//  JCRequest_updateCustomerAddressMain.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/4/3.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_updateCustomerAddressMain.h"

@implementation JCRequest_updateCustomerAddressMain
//接口地址
- (NSString *)apiMethodName{
    
    return @"customer/updateCustomerAddressMain.do";
}

//请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
