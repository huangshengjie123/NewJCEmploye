//
//  JCRequest_cancelbusinessTrip.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/25.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_cancelbusinessTrip.h"

@implementation JCRequest_cancelbusinessTrip

// 接口地址
- (NSString *)apiMethodName{
    return @"businessTrip/cancel.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}

@end
