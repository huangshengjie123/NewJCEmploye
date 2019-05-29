//
//  JCRequest_ReadallWaterCards2.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/31.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadallWaterCards2.h"

@implementation JCRequest_ReadallWaterCards2


// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/getUserExtInfoListByOrgId";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
