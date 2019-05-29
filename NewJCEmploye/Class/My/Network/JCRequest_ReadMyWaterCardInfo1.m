//
//  JCRequest_ReadMyWaterCardInfo1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyWaterCardInfo1.h"

@implementation JCRequest_ReadMyWaterCardInfo1

// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getWaterCardsByUowner.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}


@end
