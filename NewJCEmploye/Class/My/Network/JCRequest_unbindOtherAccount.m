//
//  JCRequest_unbindOtherAccount.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/4/11.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_unbindOtherAccount.h"

@implementation JCRequest_unbindOtherAccount

//接口地址
- (NSString *)apiMethodName{
    
    return @"user/unbindOtherAccount.do";
}

//请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
