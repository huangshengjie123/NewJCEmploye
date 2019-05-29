//
//  JCRequest_ReadMyProbationParams.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/20.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyProbationParams.h"

@implementation JCRequest_ReadMyProbationParams



// 接口地址
- (NSString *)apiMethodName{
    
    return @"customer/getCustomerPrepareByParams.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end