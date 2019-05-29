//
//  Request_getBindAccounts.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/14.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "Request_getBindAccounts.h"

@implementation Request_getBindAccounts

//接口地址
- (NSString *)apiMethodName{
    
    return @"user/getBindAccounts.do";
}

//请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}



@end
