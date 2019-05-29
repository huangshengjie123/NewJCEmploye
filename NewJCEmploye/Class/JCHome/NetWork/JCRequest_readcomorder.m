//
//  JCRequest_readcomorder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/16.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readcomorder.h"

@implementation JCRequest_readcomorder
// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/searchPurchasersAsLeader.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    
    return LCRequestMethodGet;
}

@end
