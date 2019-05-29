//
//  JCRequest_searchWorklog.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchWorklog.h"

@implementation JCRequest_searchWorklog

// 接口地址
- (NSString *)apiMethodName{
    
    return @"dailyLog/getDailyLogStoreByParamsWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
