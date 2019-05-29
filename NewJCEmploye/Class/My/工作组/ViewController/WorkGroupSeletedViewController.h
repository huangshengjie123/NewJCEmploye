//
//  WorkGroupSeletedViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  工作组 选人

#import "BaseViewController.h"
#import "DataModels.h"
@protocol NewMyGroupDelegate <NSObject>
@optional

-(void)NewMyGroup:(JCModel_employeeInfoData *)data;

-(void)NewMyGroupArray:(NSArray *)array;

@end
@interface WorkGroupSeletedViewController : BaseViewController
@property (nonatomic,weak)id<NewMyGroupDelegate>delegate;

@property (nonatomic,assign) BOOL ismMultiselect;//是否是多选
@property (nonatomic,strong) NSString *fromSring; //来源


@end
