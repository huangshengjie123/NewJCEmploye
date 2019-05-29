//
//  NewProbationCustomViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  新建试用客户

#import "BaseViewController.h"

@protocol NewProbationCustomDelegate <NSObject>

@optional

-(void)newSuccessed;

@end

@interface NewProbationCustomViewController : BaseViewController

@property (nonatomic,weak)id<NewProbationCustomDelegate>delegate;


@end
