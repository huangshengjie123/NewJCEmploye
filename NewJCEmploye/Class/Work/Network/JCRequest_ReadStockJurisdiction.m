//
//  JCRequest_ReadStockJurisdiction.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadStockJurisdiction.h"

@implementation JCRequest_ReadStockJurisdiction

// 接口地址
- (NSString *)apiMethodName{
    
    return @"auth/getPurAuthsByUserId.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
