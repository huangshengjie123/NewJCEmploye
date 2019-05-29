//
//  InComeDetailsViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/8.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"

@protocol DetailsActionSuccessDelegate <NSObject>

@optional

-(void)detailsActionSuccessDelegate;

@end

@interface InComeDetailsViewController : BaseViewController

@property (nonatomic,strong)  JCModel_OtherIncomeList         *listData;
@property (nonatomic, weak)   id<DetailsActionSuccessDelegate> delegate;

@end
