//
//  JCRequest_searchCheckBusinessTrip.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/22.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchCheckBusinessTrip.h"

@implementation JCRequest_searchCheckBusinessTrip


// 接口地址
- (NSString *)apiMethodName{
    return @"businessTrip/searchCheckBusinessTrip.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}

@end
