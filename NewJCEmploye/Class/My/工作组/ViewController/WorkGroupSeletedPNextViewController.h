//
//  WorkGroupSeletedPNextViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  选组员的二级界面

#import "BaseViewController.h"
#import "DataModels.h"
@protocol NewMyGroup1Delegate <NSObject>
@optional

-(void)NewMyGroup:(JCModel_employeeInfoData *)data;

-(void)NewMyGroupArray:(NSArray *)array;

@end
@interface WorkGroupSeletedPNextViewController : BaseViewController

@property (nonatomic,weak)id<NewMyGroup1Delegate>delegate;
@property (nonatomic,assign) BOOL ismMultiselect;//是否是多选
@property (nonatomic,strong) NSString *fromSring; //来源

@property (nonatomic,strong) NSArray *userDataArray;
@end
