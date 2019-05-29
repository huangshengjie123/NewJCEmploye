//
//  JCRequest_updateOrderGetamount.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/23.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "JCRequest_updateOrderGetamount.h"

@implementation JCRequest_updateOrderGetamount
// 接口地址
- (NSString *)apiMethodName{
    
    return @"flow/updateOrderGetamount.do";
}

// 请求方式
- (LCRequestMethod)requestMethod{
    return LCRequestMethodPost;
}
@end
