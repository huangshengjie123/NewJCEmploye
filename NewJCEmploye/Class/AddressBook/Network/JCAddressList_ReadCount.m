//
//  JCAddressList_ReadCount.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCAddressList_ReadCount.h"

@implementation JCAddressList_ReadCount

// 接口地址
- (NSString *)apiMethodName{
    
    return @"org/getOrgUserExtInfoNum.do";
    
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodGet;
}


@end
