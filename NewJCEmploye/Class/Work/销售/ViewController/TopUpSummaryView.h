//
//  TopUpSummaryView.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/20.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CardDownAnimationView.h"
@protocol totalDelegate <NSObject>

@optional
-(void)totalCompleted;   //完成操作 ，通知刷新

@end
@interface TopUpSummaryView : CardDownAnimationView <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, weak) id<totalDelegate> delegate2;
@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UILabel *namelabel;
@property (nonatomic,strong) UILabel *waterCardIDLabel;

@end
