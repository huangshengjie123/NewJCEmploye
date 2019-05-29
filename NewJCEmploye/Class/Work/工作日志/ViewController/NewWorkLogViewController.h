//
//  NewWorkLogViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  新建工作日志

#import "BaseViewController.h"
#import "DataModels.h"
@protocol NewWorkLogDelegate <NSObject>
@optional

-(void)newWorklogSuceess;

@end
@interface NewWorkLogViewController : BaseViewController
@property (nonatomic, weak) id<NewWorkLogDelegate> delegate;
@property (nonatomic,strong) JCModel_WorkLogList *loglist;
@property (nonatomic,strong) NSString *typeString;
@end
