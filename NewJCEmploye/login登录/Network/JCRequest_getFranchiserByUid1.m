//
//  JCRequest_getFranchiserByUid1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getFranchiserByUid1.h"

@implementation JCRequest_getFranchiserByUid1
// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/getFranchiserByUid.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}
@end
