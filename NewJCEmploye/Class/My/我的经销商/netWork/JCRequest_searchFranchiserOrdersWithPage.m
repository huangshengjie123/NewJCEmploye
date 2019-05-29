//
//  JCRequest_searchFranchiserOrdersWithPage.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_searchFranchiserOrdersWithPage.h"

@implementation JCRequest_searchFranchiserOrdersWithPage

// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchFranchiserOrdersWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
