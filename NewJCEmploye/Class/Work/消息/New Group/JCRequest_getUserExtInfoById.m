//
//  JCRequest_getUserExtInfoById.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/14.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getUserExtInfoById.h"

@implementation JCRequest_getUserExtInfoById
// 接口地址
- (NSString *)apiMethodName{
    
    return @"customer/searchCustomerTransRecord.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
