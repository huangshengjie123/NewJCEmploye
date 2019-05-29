//
//  JCRequest_ReadgetAccountsWithGroupBySearc.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadgetAccountsWithGroupBySearc.h"

@implementation JCRequest_ReadgetAccountsWithGroupBySearc

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getAccountsWithGroupBySearch.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
