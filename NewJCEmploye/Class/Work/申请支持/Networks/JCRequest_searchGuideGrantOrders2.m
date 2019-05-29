//
//  JCRequest_searchGuideGrantOrders2.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchGuideGrantOrders2.h"

@implementation JCRequest_searchGuideGrantOrders2

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchGuideGrantOrders.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
