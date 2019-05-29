//
//  JCRequest_ReadWaterCardDetails.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadWaterCardDetails.h"

@implementation JCRequest_ReadWaterCardDetails
// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getWaterCardsBySearch.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
