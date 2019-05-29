//
//  JCRequest_getProbations4Group1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getProbations4Group1.h"

@implementation JCRequest_getProbations4Group1

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getProbations4Group.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
