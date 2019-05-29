//
//  JCRequest_readInventroyWarning1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_readInventroyWarning1.h"

@implementation JCRequest_readInventroyWarning1


// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getMyPurchaser.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
