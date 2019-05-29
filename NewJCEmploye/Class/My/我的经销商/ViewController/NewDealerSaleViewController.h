//
//  NewDealerSaleViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@protocol NewFSaleSuccessDelegate <NSObject>

@optional

-(void)newFSaleSuccess;

@end
@interface NewDealerSaleViewController : BaseViewController

@property (nonatomic,assign) BOOL isNeedfilling;  //是否需要补齐
@property (nonatomic, weak) id<NewFSaleSuccessDelegate> delegate;

@property (nonatomic,strong) JCModel_SellOrderList *sellOrderList;

@property (nonatomic,strong) NSString *warehouseString;
@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic,assign) BOOL isNeedOutput;
@end
