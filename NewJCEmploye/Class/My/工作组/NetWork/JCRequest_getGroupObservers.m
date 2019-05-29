//
//  JCRequest_getGroupObservers.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getGroupObservers.h"

@implementation JCRequest_getGroupObservers

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getGroupObservers.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
