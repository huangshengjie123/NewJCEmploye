//
//  NewSellViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/15.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  新建 销售订单

#import "BaseViewController.h"
#import "DataModels.h"

@protocol NewSellSuccessDelegate <NSObject>

@optional

-(void)newSellSuccess111;

@end

@interface NewSellViewController : BaseViewController

@property (nonatomic,strong) NSString *warehouseString;
@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic, weak)  id<NewSellSuccessDelegate> delegate;

@property (nonatomic,assign) BOOL isNeedfilling;  //是否需要补齐
@property (nonatomic,strong) JCModel_SellOrderList *sellOrderList;

@end
