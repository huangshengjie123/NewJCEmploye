//
//  JCRequest_searchFranchiserRecordWithPage1.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchFranchiserRecordWithPage1.h"

@implementation JCRequest_searchFranchiserRecordWithPage1

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchFranchiserRecordWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}


@end
