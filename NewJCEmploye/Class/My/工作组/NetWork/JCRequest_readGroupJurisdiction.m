//
//  JCRequest_readGroupJurisdiction.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/2/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readGroupJurisdiction.h"

@implementation JCRequest_readGroupJurisdiction

// 接口地址
- (NSString *)apiMethodName{
    
    return @"/flow/hasRightToView.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
