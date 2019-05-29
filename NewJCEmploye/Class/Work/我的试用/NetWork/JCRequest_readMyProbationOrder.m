//
//  JCRequest_readMyProbationOrder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readMyProbationOrder.h"

@implementation JCRequest_readMyProbationOrder
// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getProbationsByGuide.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
