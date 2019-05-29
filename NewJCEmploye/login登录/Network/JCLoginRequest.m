//
//  JCLoginRequest.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/1/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCLoginRequest.h"

@implementation JCLoginRequest


// 接口地址
- (NSString *)apiMethodName{

    return @"doAppLogin.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
