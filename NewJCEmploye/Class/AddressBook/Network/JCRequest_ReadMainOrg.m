//
//  JCRequest_ReadMainOrg.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  读取主要联系人

#import "JCRequest_ReadMainOrg.h"

@implementation JCRequest_ReadMainOrg

// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/getOrgUserExInfo.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
