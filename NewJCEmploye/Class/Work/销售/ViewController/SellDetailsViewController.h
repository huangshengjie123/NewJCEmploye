//
//  SellDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@protocol SellDetailsSuccessDelegate <NSObject>

@optional

-(void)takeSellSuccess;

@end
@interface SellDetailsViewController : BaseViewController

@property (nonatomic,strong) JCModel_SellOrderList *sellOrderList;
@property (nonatomic,strong) JCModel_ReceivableOrderList *receivableOrderList;
@property (nonatomic, weak) id<SellDetailsSuccessDelegate> delegate;
@property (nonatomic,strong) NSString *signString;
@property (nonatomic,assign) BOOL isReadOfLeader;//是否是领导查看

@property (nonatomic,strong) JCModel_EmpSupportOrderList  *listData;

@end
