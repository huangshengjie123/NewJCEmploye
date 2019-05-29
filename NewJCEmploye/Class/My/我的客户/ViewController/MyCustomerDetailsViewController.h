//
//  MyCustomerDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"

@protocol MyCustomerDetailsDelegate <NSObject>

@optional

-(void)takeSuccussDeetails2;

@end

@interface MyCustomerDetailsViewController : BaseViewController


@property (nonatomic,strong)  JCModel_GetCustmerData       *data;
@property (nonatomic,weak)    id<MyCustomerDetailsDelegate>delegate;


@end
