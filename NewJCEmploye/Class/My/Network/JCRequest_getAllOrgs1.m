//
//  JCRequest_getAllOrgs1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/2.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getAllOrgs1.h"

@implementation JCRequest_getAllOrgs1

//接口地址
- (NSString *)apiMethodName{
    
    return @"org/getAllOrgs.do";
}

//请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
