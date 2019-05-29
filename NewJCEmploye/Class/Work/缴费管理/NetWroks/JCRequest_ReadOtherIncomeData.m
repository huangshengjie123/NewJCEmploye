//
//  JCRequest_ReadOtherIncomeData.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/11.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadOtherIncomeData.h"

@implementation JCRequest_ReadOtherIncomeData


// 接口地址
- (NSString *)apiMethodName{
    
    return @"searchIncomeByAccountant.mdo";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
