//
//  Request_readItemClasesify.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "Request_readItemClasesify.h"

@implementation Request_readItemClasesify

// 接口地址
- (NSString *)apiMethodName{
    
    return @"item/getMetaByParams.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
