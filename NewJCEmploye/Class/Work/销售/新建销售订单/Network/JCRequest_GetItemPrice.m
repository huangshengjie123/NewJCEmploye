//
//  JCRequest_GetItemPrice.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/15.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_GetItemPrice.h"

@implementation JCRequest_GetItemPrice

// 接口地址
- (NSString *)apiMethodName{
    
    return @"item/getItemSerialByid.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
