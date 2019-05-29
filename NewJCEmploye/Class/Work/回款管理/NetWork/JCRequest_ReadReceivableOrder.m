//
//  JCRequest_ReadReceivableOrder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadReceivableOrder.h"

@implementation JCRequest_ReadReceivableOrder

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getFinanceOrdersByPageSearch.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
