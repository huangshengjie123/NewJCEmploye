//
//  JCRequest_getUserEinfo.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/4/10.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getUserEinfo.h"

@implementation JCRequest_getUserEinfo
// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/getUserExtInfoById";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
