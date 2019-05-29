//
//  SelectedPForCarViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/19.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
@protocol NewSelectedPForCarDelegate <NSObject>
@optional

-(void)newSuccuss;

@end
@interface SelectedPForCarViewController : BaseViewController
@property (nonatomic,weak)id<NewSelectedPForCarDelegate>delegate;

@end
