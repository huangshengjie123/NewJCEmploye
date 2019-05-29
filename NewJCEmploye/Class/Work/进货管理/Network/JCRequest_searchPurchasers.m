//
//  JCRequest_searchPurchasers.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchPurchasers.h"

@implementation JCRequest_searchPurchasers


// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/searchPurchasers.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
