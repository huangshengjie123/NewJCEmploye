//
//  TestRequest.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/1.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "TestRequest.h"

@implementation TestRequest

// 接口地址
- (NSString *)apiMethodName{
    
    return @"hello";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}


@end
