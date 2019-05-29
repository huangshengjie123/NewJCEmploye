//
//  JCRequest_readallWaterCards.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/31.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readallWaterCards.h"

@implementation JCRequest_readallWaterCards

// 接口地址
- (NSString *)apiMethodName{
    
    return @"org/getOrgByWaterCardId.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
