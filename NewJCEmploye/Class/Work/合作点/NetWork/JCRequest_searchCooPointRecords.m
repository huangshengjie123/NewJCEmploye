//
//  JCRequest_searchCooPointRecords.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchCooPointRecords.h"

@implementation JCRequest_searchCooPointRecords

// 接口地址
- (NSString *)apiMethodName{
    
    return @"cooPoint/searchCooPointRecords.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
