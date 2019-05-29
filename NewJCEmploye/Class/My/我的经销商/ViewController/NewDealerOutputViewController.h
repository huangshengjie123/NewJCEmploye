//
//  NewDealerOutputViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  新建经销商出库

#import "BaseViewController.h"
@protocol NewFOutputSuccessDelegate <NSObject>

@optional

-(void)newFOutputSuccess;

@end
@interface NewDealerOutputViewController : BaseViewController
@property (nonatomic, weak) id<NewFOutputSuccessDelegate> delegate;

@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic,strong) NSString *warehouseName;
@end
