//
//  JCRequest_updateUserPasswdByIdCode.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_updateUserPasswdByIdCode.h"

@implementation JCRequest_updateUserPasswdByIdCode
// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/updateUserPasswdByIdCode.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}
@end
