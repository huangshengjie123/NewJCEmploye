//
//  MyCooperationViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BaseViewController.h"
#import "DataModels.h"
@protocol MyCooperationPointDelegate <NSObject>

@optional

-(void)selectMyCooperationPoiontReturn:(JCModel_CooperationList *)custmerData;

@end
@interface MyCooperationViewController : BaseViewController
@property (nonatomic,weak)id<MyCooperationPointDelegate>delegate;
@property(nonatomic,strong) NSString *fromString;
@property (nonatomic,strong) NSString *guideSring;
@end
