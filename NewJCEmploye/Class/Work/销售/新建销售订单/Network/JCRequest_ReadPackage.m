//
//  JCRequest_ReadPackage.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadPackage.h"

@implementation JCRequest_ReadPackage

// 接口地址
- (NSString *)apiMethodName{
    
    return @"item/getAllSellGroups.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
