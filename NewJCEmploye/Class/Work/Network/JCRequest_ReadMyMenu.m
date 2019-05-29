//
//  JCRequest_ReadMyMenu.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyMenu.h"

@implementation JCRequest_ReadMyMenu

// 接口地址
- (NSString *)apiMethodName{
    
    return @"auth/getMenuAuthsByUser.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}


@end
