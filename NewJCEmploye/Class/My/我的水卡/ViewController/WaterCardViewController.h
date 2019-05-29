//
//  WaterCardViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  水卡界面

#import "BaseViewController.h"

@interface WaterCardViewController : BaseViewController

@property (nonatomic,strong) NSString *numstring;
@property (nonatomic,strong) NSString *groupId;
@property (nonatomic,assign) BOOL      isFinancial;//是否是财务充值

@end
