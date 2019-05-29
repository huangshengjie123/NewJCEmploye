//
//  JCRequest_ReadWarning.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadWarning.h"

@implementation JCRequest_ReadWarning


// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/getWaterWarningByParamsWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
