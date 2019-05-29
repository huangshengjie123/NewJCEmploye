//
//  LCRquest_searchFranchiserInOutOrders.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "LCRquest_searchFranchiserInOutOrders.h"

@implementation LCRquest_searchFranchiserInOutOrders

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchFranchiserInOutOrdersWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
