//
//  JCRequest_readleaderreimbursement.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/19.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readleaderreimbursement.h"

@implementation JCRequest_readleaderreimbursement
// 接口地址
- (NSString *)apiMethodName{
    
    return @"reimbursement/searchCheckReimbursement.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
