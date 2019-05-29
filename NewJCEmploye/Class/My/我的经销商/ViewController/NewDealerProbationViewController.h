//
//  NewDealerProbationViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
@protocol NewFProbationSuccessDelegate <NSObject>

@optional

-(void)newFProbationSuccess;

@end
@interface NewDealerProbationViewController : BaseViewController
@property (nonatomic, weak) id<NewFProbationSuccessDelegate> delegate;
@property (nonatomic,strong) NSString *warehouseString;
@property (nonatomic,strong) NSString *warehouseId;
@property (nonatomic,assign) BOOL isNeedOutput;

@end
