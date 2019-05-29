//
//  JCRequest_getResaleStatisticBySearch.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/26.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getResaleStatisticBySearch.h"

@implementation JCRequest_getResaleStatisticBySearch
// 接口地址
- (NSString *)apiMethodName{
    
    return @"getResaleStatisticBySearch.mdo";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
