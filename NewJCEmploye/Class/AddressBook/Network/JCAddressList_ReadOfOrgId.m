//
//  JCAddressList_ReadOfOrgId.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCAddressList_ReadOfOrgId.h"

@implementation JCAddressList_ReadOfOrgId

// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/getUserExtInfoListByOrgId";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
