//
//  JCRequest_ReadMyBulletin.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_ReadMyBulletin.h"

@implementation JCRequest_ReadMyBulletin

// 接口地址
- (NSString *)apiMethodName{
    
    return @"bulletin/getBulletinByOrgId";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}

@end
