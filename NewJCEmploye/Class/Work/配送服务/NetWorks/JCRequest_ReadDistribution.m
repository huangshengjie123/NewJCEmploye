//
//  JCRequest_ReadDistribution.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadDistribution.h"

@implementation JCRequest_ReadDistribution

// 接口地址
- (NSString *)apiMethodName{
    
    return @"distribution/getDistributionByParamsWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
