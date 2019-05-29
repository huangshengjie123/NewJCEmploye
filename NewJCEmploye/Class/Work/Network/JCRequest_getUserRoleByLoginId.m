//
//  JCRequest_getUserRoleByLoginId.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getUserRoleByLoginId.h"

@implementation JCRequest_getUserRoleByLoginId


// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/getUserRoleByLoginId.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
