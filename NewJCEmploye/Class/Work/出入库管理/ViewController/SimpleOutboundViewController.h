//
//  SimpleOutboundViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  简易出库

#import "BaseViewController.h"
#import "DataModels.h"
@protocol SimpleOutboundDelegate <NSObject>
@optional

-(void)simpleOutboundSuceess;

@end
@interface SimpleOutboundViewController : BaseViewController

@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic,strong) NSString *warehouseName;
@property (nonatomic,strong) NSString *userId;

@property (nonatomic, weak) id<SimpleOutboundDelegate> delegate;
@property (nonatomic,strong) NSString *tpyeString;
@property (nonatomic,strong) NSString *waterCardId;
@property (nonatomic,assign) double userID2;



@end
