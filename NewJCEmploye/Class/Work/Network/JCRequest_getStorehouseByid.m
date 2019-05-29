//
//  JCRequest_getStorehouseByid.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/4/8.
//  Copyright © 2019 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getStorehouseByid.h"

@implementation JCRequest_getStorehouseByid
// 接口地址
- (NSString *)apiMethodName{
    
    return @"storeHouse/getStoreHouseByUp.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
