//
//  BindingViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  绑定界面

#import "BaseViewController.h"
@protocol BindlingSuccessDelegate <NSObject>

@optional

-(void)bindlingSuccess:(NSString*)string;

@end
@interface BindingViewController : BaseViewController
@property (nonatomic, weak) id<BindlingSuccessDelegate> delegate;

@end
