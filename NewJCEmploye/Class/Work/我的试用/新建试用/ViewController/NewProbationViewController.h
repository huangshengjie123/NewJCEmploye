//
//  NewProbationViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  新建试用单

#import "BaseViewController.h"
@protocol NewProbationSuccessDelegate <NSObject>

@optional

-(void)newProbationSuccess;

@end

@interface NewProbationViewController : BaseViewController
@property (nonatomic, weak) id<NewProbationSuccessDelegate> delegate;
@property (nonatomic,strong) NSString *warehouseString;
@property (nonatomic,strong) NSString *warehouseId;
@end
