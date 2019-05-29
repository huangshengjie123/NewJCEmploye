//
//  JCRequest_ReadAllSell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadAllSell.h"

@implementation JCRequest_ReadAllSell

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getSaleOrdersByPageSearch.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
