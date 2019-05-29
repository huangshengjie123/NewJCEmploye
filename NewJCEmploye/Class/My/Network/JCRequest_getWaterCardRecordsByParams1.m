//
//  JCRequest_getWaterCardRecordsByParams1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getWaterCardRecordsByParams1.h"

@implementation JCRequest_getWaterCardRecordsByParams1

// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getWaterCardRecordsByParams.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}


@end
