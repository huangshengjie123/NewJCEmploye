//
//  JCRequest_bindOtherAccount.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/14.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_bindOtherAccount.h"

@implementation JCRequest_bindOtherAccount
// 接口地址
- (NSString *)apiMethodName{
    
    return @"user/bindOtherAccount.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
