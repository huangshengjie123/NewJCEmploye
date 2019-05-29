//
//  JCRequset_SearchCode.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/15.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequset_SearchCode.h"

@implementation JCRequset_SearchCode

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/searchMyInOutFlowInfo.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
