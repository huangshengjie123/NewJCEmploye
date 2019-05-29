//
//  JCRequest_readMyFinfo.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readMyFinfo.h"

@implementation JCRequest_readMyFinfo

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/getFranchiserById.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
