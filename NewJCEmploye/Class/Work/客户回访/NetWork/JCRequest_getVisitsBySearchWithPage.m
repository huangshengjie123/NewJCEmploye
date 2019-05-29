//
//  JCRequest_getVisitsBySearchWithPage.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getVisitsBySearchWithPage.h"

@implementation JCRequest_getVisitsBySearchWithPage


// 接口地址
- (NSString *)apiMethodName{
    
    return @"visit/getVisitsBySearchWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
