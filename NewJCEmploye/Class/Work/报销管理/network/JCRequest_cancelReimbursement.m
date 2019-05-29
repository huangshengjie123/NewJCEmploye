//
//  JCRequest_cancelReimbursement.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_cancelReimbursement.h"

@implementation JCRequest_cancelReimbursement


- (NSString *)apiMethodName{
    
    return @"reimbursement/cancel.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
