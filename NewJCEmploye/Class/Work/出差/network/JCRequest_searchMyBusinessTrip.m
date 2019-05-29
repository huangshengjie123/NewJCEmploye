//
//  JCRequest_searchMyBusinessTrip.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchMyBusinessTrip.h"

@implementation JCRequest_searchMyBusinessTrip
// 接口地址
- (NSString *)apiMethodName{
    
    return @"businessTrip/searchMyBusinessTrip.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
