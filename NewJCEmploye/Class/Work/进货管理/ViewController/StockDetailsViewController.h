//
//  StockDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  详情

#import "BaseViewController.h"
#import "DataModels.h"
@protocol  StockDetailsSuccessDelegate <NSObject>

@optional

-(void)takeSellSuccess;

@end
@interface StockDetailsViewController : BaseViewController
@property (nonatomic, weak) id<StockDetailsSuccessDelegate> delegate;

@property (nonatomic,strong)  JCModel_searchPurchaserstabelList *listData;
@property (nonatomic,assign) BOOL isBeyound; //是否是超期待办

@end
