//
//  JCRequest_getDistributionByParamsWithPage.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getDistributionByParamsWithPage.h"

@implementation JCRequest_getDistributionByParamsWithPage


// 接口地址
- (NSString *)apiMethodName{
    
    return @"distribution/getDistributionByParamsWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
