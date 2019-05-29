//
//  MyCustomerViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  我的客户

#import "BaseViewController.h"
#import "DataModels.h"

@protocol MyCustomerDelegate <NSObject>

@optional

-(void)selectMyCustomerReturn:(JCModel_GetCustmerData *)custmerData;

@end

@interface MyCustomerViewController : BaseViewController

@property (nonatomic, strong)  NSString *fromString;
@property (nonatomic, weak)    id<MyCustomerDelegate>delegate;
@property (nonatomic, strong)  NSString *guideSring;//员工ID

@end
