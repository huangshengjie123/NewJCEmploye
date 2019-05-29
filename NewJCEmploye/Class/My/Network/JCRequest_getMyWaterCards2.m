//
//  JCRequest_getMyWaterCards2.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getMyWaterCards2.h"

@implementation JCRequest_getMyWaterCards2


// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getMyWaterCards.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
