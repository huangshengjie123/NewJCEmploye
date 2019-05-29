//
//  NewOtherIncomeViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/8.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
@protocol NewOtherIncomeSuccessDelegate <NSObject>

@optional

-(void)newOtherIncomeSuccess;

@end
@interface NewOtherIncomeViewController : BaseViewController
@property (nonatomic, weak) id<NewOtherIncomeSuccessDelegate> delegate;

@end
