//
//  JCRequest_getUserItemsGroup.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getUserItemsGroup.h"

@implementation JCRequest_getUserItemsGroup


// 接口地址
- (NSString *)apiMethodName{
    
    return @"item/getUserItems4Group.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
