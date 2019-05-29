//
//  JCRequest_ReadRecycling.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/16.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadRecycling.h"

@implementation JCRequest_ReadRecycling

// 接口地址
- (NSString *)apiMethodName{
    
    return @"cooPoint/getCooPointCostNoBackById.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
