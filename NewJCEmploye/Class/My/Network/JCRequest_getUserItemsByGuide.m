//
//  JCRequest_getUserItemsByGuide.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getUserItemsByGuide.h"

@implementation JCRequest_getUserItemsByGuide

// 接口地址
- (NSString *)apiMethodName{
    
    return @"item/getUserItemsByGuide.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
