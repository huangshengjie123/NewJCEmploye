//
//  JCRequest_readFreimbursementdata.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/19.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readFreimbursementdata.h"

@implementation JCRequest_readFreimbursementdata


// 接口地址
- (NSString *)apiMethodName{
    
    return @"reimbursement/searchComReimbursement.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
