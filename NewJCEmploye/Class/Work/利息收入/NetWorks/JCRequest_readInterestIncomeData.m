//
//  JCRequest_readInterestIncomeData.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/13.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readInterestIncomeData.h"

@implementation JCRequest_readInterestIncomeData


// 接口地址
- (NSString *)apiMethodName{
    
    return @"searchLoan.mdo";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
