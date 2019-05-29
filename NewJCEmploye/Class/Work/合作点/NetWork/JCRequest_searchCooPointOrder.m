//
//  JCRequest_searchCooPointOrder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchCooPointOrder.h"

@implementation JCRequest_searchCooPointOrder

// 接口地址
- (NSString *)apiMethodName{
    
    return @"cooPoint/searchCooPointOrder.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
