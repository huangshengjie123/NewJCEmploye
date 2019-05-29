//
//  NewCleanOrderViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//   新的转赠订单

#import "BaseViewController.h"
#import "DataModels.h"
@interface NewCleanOrderViewController : BaseViewController


@property (nonatomic,strong) NSString *waterCardID;
@property (nonatomic,strong) JCModel_WaterCardDetailsBase *base;
@end
