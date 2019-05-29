//
//  JCRequest_ReadAllTotalOutOrder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/1.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadAllTotalOutOrder.h"

@implementation JCRequest_ReadAllTotalOutOrder

// 接口地址
- (NSString *)apiMethodName{
    
    return @"inOutOrder/getInOutOrderItemsAdvance.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
