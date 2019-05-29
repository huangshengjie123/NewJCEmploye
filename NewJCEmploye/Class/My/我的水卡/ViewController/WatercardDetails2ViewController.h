//
//  WatercardDetails2ViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@interface WatercardDetails2ViewController : BaseViewController

@property (nonatomic,strong) NSString *userId;
@property (nonatomic,strong) NSArray  *itemDataArray;

@property (nonatomic,strong) NSString *waterCardID;
@property (nonatomic,strong) NSString *numstring;
@property (nonatomic,strong) NSString *groupId;

@property (nonatomic,strong) NSString *idSring;//水卡ID
@property (nonatomic,assign) BOOL     isFinancial;//是否是财务充值
@end
