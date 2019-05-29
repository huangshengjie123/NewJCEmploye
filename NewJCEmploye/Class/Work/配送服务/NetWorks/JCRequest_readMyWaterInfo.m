//
//  JCRequest_readMyWaterInfo.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readMyWaterInfo.h"

@implementation JCRequest_readMyWaterInfo

// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getWaterCardsByUowner.do?";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
