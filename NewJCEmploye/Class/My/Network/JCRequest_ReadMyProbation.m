//
//  JCRequest_ReadMyProbation.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyProbation.h"

@implementation JCRequest_ReadMyProbation

// 接口地址
- (NSString *)apiMethodName{
    
    return @"customer/getCustomerPrepareByGuide.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}


@end
