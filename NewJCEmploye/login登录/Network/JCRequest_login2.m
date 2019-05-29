//
//  JCRequest_login2.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/4/4.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_login2.h"

@implementation JCRequest_login2

// 接口地址
- (NSString *)apiMethodName{
    
    return @"doAppLoginTemp.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
