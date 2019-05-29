//
//  JCRequest_NewProbationOrder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_NewProbationOrder.h"
#import "JCTokenManager.h"
@implementation JCRequest_NewProbationOrder
// 接口地址
- (NSString *)apiMethodName{
    NSString *token = [JCTokenManager getToken];
    NSString *string = [NSString stringWithFormat:@"flow/dealProbation.do?isAppLogin=true&jc4login=%@",token];
    return string;
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

- (LCRequestSerializerType)requestSerializerType {
    return LCRequestSerializerTypeJSON;
}

@end
