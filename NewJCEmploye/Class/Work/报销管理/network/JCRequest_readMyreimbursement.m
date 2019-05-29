//
//  JCRequest_readMyreimbursement.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/18.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readMyreimbursement.h"

@implementation JCRequest_readMyreimbursement

// 接口地址
- (NSString *)apiMethodName{
    
    return @"reimbursement/searchMyReimbursement.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}

@end
