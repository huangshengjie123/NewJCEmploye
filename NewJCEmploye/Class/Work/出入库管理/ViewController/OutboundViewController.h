//
//  OutboundViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/1.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  出库单

#import "BaseViewController.h"
#import "DataModels.h"

@protocol  OperationCompletedDelegate <NSObject>

@optional

-(void)operationCompleted;   //完成操作 ，通知刷新

@end

@interface OutboundViewController : BaseViewController

@property (nonatomic,strong)  JCModel_InAndOutList *listData;
@property (nonatomic, weak)   id<OperationCompletedDelegate> delegate;
@property (nonatomic,strong)  NSString *vcString;
@property (nonatomic,strong)  NSString *vc;
@property (nonatomic,assign)  BOOL isBeyound; //是否是超期待办


@end
