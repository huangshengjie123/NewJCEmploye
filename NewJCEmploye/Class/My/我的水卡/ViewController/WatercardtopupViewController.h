//
//  WatercardtopupViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  充值水卡

#import "BaseViewController.h"

@interface WatercardtopupViewController : BaseViewController
@property (nonatomic,strong) NSString *numstring;
@property (nonatomic,strong) NSString *groupId;
@property (nonatomic,assign) BOOL isFinancial;//是否是财务充值
@property (nonatomic,strong) NSString *idString33; //水卡卡号
@end
