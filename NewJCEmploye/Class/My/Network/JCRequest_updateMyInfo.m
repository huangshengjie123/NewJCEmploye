//
//  JCRequest_updateMyInfo.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_updateMyInfo.h"

@implementation JCRequest_updateMyInfo

// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/updateUserExtInfoById";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
