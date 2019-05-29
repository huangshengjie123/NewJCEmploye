//
//  JCRequset_ReadinAndOutOrder.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequset_ReadinAndOutOrder.h"

@implementation JCRequset_ReadinAndOutOrder

// 接口地址
- (NSString *)apiMethodName{
    
    return @"inOutOrder/getInOutOrdersAdvance.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
