//
//  JCRequest_ReadSearchDonationRecords.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadSearchDonationRecords.h"

@implementation JCRequest_ReadSearchDonationRecords
// 接口地址
- (NSString *)apiMethodName{
    
    return @"watercard/searchDonationRecords.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
