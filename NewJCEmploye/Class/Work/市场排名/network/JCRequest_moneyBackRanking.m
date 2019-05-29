//
//  JCRequest_moneyBackRanking.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/27.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_moneyBackRanking.h"

@implementation JCRequest_moneyBackRanking
//接口地址
- (NSString *)apiMethodName{
    
    return @"moneyBackRanking.mdo";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (BOOL)useViceUrl; {
    return YES;
}
@end
