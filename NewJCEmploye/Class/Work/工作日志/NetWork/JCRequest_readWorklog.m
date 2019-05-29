//
//  JCRequest_readWorklog.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readWorklog.h"

@implementation JCRequest_readWorklog

// 接口地址
- (NSString *)apiMethodName{
    
    return @"dailyLog/getDailyLogStoreByParamsWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
