//
//  JCRquest_searchFranchisersWithPage.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRquest_searchFranchisersWithPage.h"

@implementation JCRquest_searchFranchisersWithPage


// 接口地址
- (NSString *)apiMethodName{
    
    return @"franchiser/searchFranchisersWithPage.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
