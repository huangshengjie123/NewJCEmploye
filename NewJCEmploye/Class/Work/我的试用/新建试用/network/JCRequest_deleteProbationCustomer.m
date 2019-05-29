//
//  JCRequest_deleteProbationCustomer.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_deleteProbationCustomer.h"

@implementation JCRequest_deleteProbationCustomer
// 接口地址
- (NSString *)apiMethodName{
    
    return @"customer/deleteCustomerPrepareById.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
