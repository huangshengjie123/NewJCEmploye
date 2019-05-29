//
//  JCRequest_readSupportReceiveOrder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readSupportReceiveOrder.h"

@implementation JCRequest_readSupportReceiveOrder

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchFranchiserGrantOrders.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
