//
//  ReWriteSelectedViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  重新选择物品界面

#import "BaseViewController.h"
@protocol ReSelectItemsDelegate <NSObject>
@optional

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString;

@end
@interface ReWriteSelectedViewController : BaseViewController

@property (nonatomic,strong) NSString *typeString;
@property (nonatomic, weak) id<ReSelectItemsDelegate> delegate;

@end
