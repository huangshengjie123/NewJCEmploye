//
//  NewMyCustomerViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  新建我的客户

#import "BaseViewController.h"
#import "DataModels.h"

@protocol NewMyCustomerDelegate <NSObject>

@optional

-(void)NewMyCustomerSuccuss2;

@end

@interface NewMyCustomerViewController : BaseViewController

@property (nonatomic,weak)    id<NewMyCustomerDelegate>delegate;
@property (nonatomic,strong)  JCModel_GetCustmerData   *data;
@property (nonatomic,strong)  NSString               *typeString;


@end
