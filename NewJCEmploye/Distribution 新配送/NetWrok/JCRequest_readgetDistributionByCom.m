//
//  JCRequest_readgetDistributionByCom.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readgetDistributionByCom.h"

@implementation JCRequest_readgetDistributionByCom

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getDistributionByCom.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
