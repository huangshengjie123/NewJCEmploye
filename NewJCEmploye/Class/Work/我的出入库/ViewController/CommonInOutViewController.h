//
//  CommonInOutViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  新建普通出入库

#import "BaseViewController.h"
@protocol CommonInOutDelegate <NSObject>
@optional

-(void)commonInOutSuceess;

@end
@interface CommonInOutViewController : BaseViewController

@property (nonatomic,strong) NSString *typeString;
@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic,strong) NSString *warehouseName;
@property (nonatomic, weak) id<CommonInOutDelegate> delegate;

@end
