//
//  JCRequest_getnumbertodolistovertime.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getnumbertodolistovertime.h"

@implementation JCRequest_getnumbertodolistovertime


// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getNumberTodoListOverTime.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
