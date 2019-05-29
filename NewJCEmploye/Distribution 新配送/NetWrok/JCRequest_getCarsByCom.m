//
//  JCRequest_getCarsByCom.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getCarsByCom.h"

@implementation JCRequest_getCarsByCom


// 接口地址
- (NSString *)apiMethodName{
    
    return @"cars/getCarsByCom.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
