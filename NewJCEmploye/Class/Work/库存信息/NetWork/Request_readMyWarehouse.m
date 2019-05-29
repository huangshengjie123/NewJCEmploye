//
//  Request_readMyWarehouse.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "Request_readMyWarehouse.h"

@implementation Request_readMyWarehouse
// 接口地址
- (NSString *)apiMethodName{
    
    return @"storeHouse/getStoreHouseByUp.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}

@end
