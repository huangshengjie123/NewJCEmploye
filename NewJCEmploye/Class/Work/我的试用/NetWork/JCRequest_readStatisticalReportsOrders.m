//
//  JCRequest_readStatisticalReportsOrders.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readStatisticalReportsOrders.h"

@implementation JCRequest_readStatisticalReportsOrders

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getProbationsBySearch.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
