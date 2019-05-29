//
//  JCRequest_ReadMyOtherIncomeData.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/11.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyOtherIncomeData.h"

@implementation JCRequest_ReadMyOtherIncomeData

// 接口地址
- (NSString *)apiMethodName{
    
    return @"searchMyIncomes.mdo";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
//副url
- (BOOL)useViceUrl; {
    return YES;
}

@end
