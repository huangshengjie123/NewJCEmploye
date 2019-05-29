//
//  JCRequest_getDistributionDetailById1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getDistributionDetailById1.h"

@implementation JCRequest_getDistributionDetailById1

// 接口地址
- (NSString *)apiMethodName{
    
    return @"distribution/getDistributionDetailById.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
