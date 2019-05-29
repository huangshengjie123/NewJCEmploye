//
//  NewCooperationPointViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@protocol NewCooperationPointSuccessDelegate <NSObject>

@optional

-(void)NewCooperationPoint111;

@end

@interface NewCooperationPointViewController : BaseViewController
@property (nonatomic,strong) NSArray *warehouseArray;
@property (nonatomic,strong) NSString *warehouseString;
@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic, weak) id<NewCooperationPointSuccessDelegate> delegate;



@end
