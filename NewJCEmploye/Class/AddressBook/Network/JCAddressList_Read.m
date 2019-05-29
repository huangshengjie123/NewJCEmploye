//
//  JCAddressList_Read.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCAddressList_Read.h"

@implementation JCAddressList_Read 

// 接口地址
- (NSString *)apiMethodName{
    
    return @"org/getAllOrgs.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}



@end
