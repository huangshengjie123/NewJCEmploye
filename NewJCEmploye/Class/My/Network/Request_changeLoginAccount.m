//
//  Request_changeLoginAccount.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/14.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "Request_changeLoginAccount.h"

@implementation Request_changeLoginAccount


//接口地址
- (NSString *)apiMethodName{
    
    return @"changeLoginAccount.do";
}

//请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
