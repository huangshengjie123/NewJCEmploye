//
//  JCRequest_readAddress.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readAddress.h"

@implementation JCRequest_readAddress

// 接口地址
- (NSString *)apiMethodName{
    
    return @"area/getAeraTree.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
