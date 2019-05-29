//
//  SalesmaNewSaleOrderViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  经销商支持新建订单

#import "BaseViewController.h"
#import "DataModels.h"
@protocol NewSellSuccessOrderDelegate <NSObject>

@optional

-(void)newSellSuccess;

@end

@interface SalesmaNewSaleOrderViewController : BaseViewController
@property (nonatomic,strong) JCModel_EmpSupportOrderList  *listData;
@property (nonatomic,strong) NSString *warehouseString;
@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic, weak) id<NewSellSuccessOrderDelegate> delegate;

@end
