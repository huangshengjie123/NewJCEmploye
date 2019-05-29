//
//  JCRequest_searchFranProbationsWithPage.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchFranProbationsWithPage.h"

@implementation JCRequest_searchFranProbationsWithPage

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchFranProbationsWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
