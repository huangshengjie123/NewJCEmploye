//
//  JCRequest_updateCooPointCostItemBackItemXNums.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/17.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_updateCooPointCostItemBackItemXNums.h"

@implementation JCRequest_updateCooPointCostItemBackItemXNums

// 接口地址
- (NSString *)apiMethodName{
    
    return @"cooPoint/updateCooPointCostItemBack.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
