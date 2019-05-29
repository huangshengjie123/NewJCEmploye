//
//  WatercardDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@interface WatercardDetailsViewController : BaseViewController


@property (nonatomic,strong) NSString *waterCardID;
@property (nonatomic,strong) JCModel_WaterCardDetailsBase *base;

@end
