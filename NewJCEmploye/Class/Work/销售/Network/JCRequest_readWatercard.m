//
//  JCRequest_readWatercard.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readWatercard.h"

@implementation JCRequest_readWatercard

// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getWaterCardsByOwnerOrg.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
