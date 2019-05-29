//
//  JCLoginOutRequest.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCLoginOutRequest.h"

@implementation JCLoginOutRequest

// 接口地址
- (NSString *)apiMethodName{
    
    
    return @"logoutApp.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    
    return LCRequestMethodGet;
}


@end
