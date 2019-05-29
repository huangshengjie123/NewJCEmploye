//
//  JCRequest_DeleteWorkLog.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_DeleteWorkLog.h"

@implementation JCRequest_DeleteWorkLog

// 接口地址
- (NSString *)apiMethodName{
    
    return @"dailyLog/deleteDailyLogStoreById.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
