//
//  JCRequest_getPurDisList.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getPurDisList.h"

@implementation JCRequest_getPurDisList

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getPurDisList.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
