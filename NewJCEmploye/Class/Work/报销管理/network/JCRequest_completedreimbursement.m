//
//  JCRequest_completedreimbursement.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_completedreimbursement.h"

@implementation JCRequest_completedreimbursement
- (NSString *)apiMethodName{
    
    return @"reimbursement/completed.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
