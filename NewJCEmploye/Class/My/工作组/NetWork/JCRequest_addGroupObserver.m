//
//  JCRequest_addGroupObserver.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_addGroupObserver.h"

@implementation JCRequest_addGroupObserver

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/setGroupObserver.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}


@end
