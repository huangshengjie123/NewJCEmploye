//
//  JCRequest_getSaleOrders4Group2.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_getSaleOrders4Group2.h"

@implementation JCRequest_getSaleOrders4Group2

// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/getSaleOrders4Group.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
//http://192.168.0.156:8080/oa/flow/getSaleOrders4Group.do?groupId=3&pageNum=1&pageSize=10&guide=106&noStop=stop&createTime=2018-06-20&createTimeRear=2018-06-21

@end
