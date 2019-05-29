//
//  JCRequest_getFranchiserByIdAndMtype.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getFranchiserByIdAndMtype.h"

@implementation JCRequest_getFranchiserByIdAndMtype

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/getFranchiserByIdAndMtype.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
