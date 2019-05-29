//
//  JCRquest_getOrgTypeZero.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/20.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRquest_getOrgTypeZero.h"

@implementation JCRquest_getOrgTypeZero

// 接口地址
- (NSString *)apiMethodName{
    
    return @"org/getOrgTypeZero.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
