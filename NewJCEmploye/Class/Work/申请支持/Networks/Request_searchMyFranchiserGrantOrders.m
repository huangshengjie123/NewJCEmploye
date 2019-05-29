//
//  Request_searchMyFranchiserGrantOrders.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "Request_searchMyFranchiserGrantOrders.h"

@implementation Request_searchMyFranchiserGrantOrders

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchMyFranchiserGrantOrders.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
