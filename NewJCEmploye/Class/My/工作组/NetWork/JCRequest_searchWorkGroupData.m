//
//  JCRequest_searchWorkGroupData.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchWorkGroupData.h"

@implementation JCRequest_searchWorkGroupData


// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/searchWorkGroup.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    
    return LCRequestMethodPost;
}
@end
