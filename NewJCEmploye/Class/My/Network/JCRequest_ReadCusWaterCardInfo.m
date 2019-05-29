//
//  JCRequest_ReadCusWaterCardInfo.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadCusWaterCardInfo.h"

@implementation JCRequest_ReadCusWaterCardInfo



// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getCusWaterCards.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
