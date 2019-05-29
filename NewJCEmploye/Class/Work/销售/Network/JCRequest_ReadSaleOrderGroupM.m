//
//  JCRequest_ReadSaleOrderGroupM.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadSaleOrderGroupM.h"

@implementation JCRequest_ReadSaleOrderGroupM

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getSaleOrdersBySearch.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
