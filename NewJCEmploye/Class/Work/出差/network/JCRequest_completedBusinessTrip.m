//
//  JCRequest_completedBusinessTrip.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/25.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_completedBusinessTrip.h"

@implementation JCRequest_completedBusinessTrip
// 接口地址
- (NSString *)apiMethodName{
    return @"businessTrip/completed.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
