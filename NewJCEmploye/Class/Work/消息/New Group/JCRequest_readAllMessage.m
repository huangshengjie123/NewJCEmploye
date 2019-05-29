//
//  JCRequest_readAllMessage.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/14.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readAllMessage.h"

@implementation JCRequest_readAllMessage

// 接口地址
- (NSString *)apiMethodName{
    
    return @"msg/searchMsg.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
