//
//  YMSOpenNotifyDownView.h
//  yimashuo
//
//  Created by imqiuhang on 15/12/18.
//  Copyright © 2015年 imqiuhang. All rights reserved.
//

#import "CardDownAnimationView.h"
@protocol totalDelegate <NSObject>

@optional
-(void)totalCompleted:(NSString *)str;   //完成操作 ，通知刷新

@end
@interface YMSOpenNotifyDownView : CardDownAnimationView <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView ;
@property (nonatomic,strong) NSString *totalSring;//商品总额
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *data2Array; //赠品array
@property (nonatomic,strong) UILabel *label2; //商品总额
@property (nonatomic, weak) id<totalDelegate> delegate2;

@property (nonatomic,strong) UILabel *packgeLabel; //套餐label;
@property (nonatomic,strong) UILabel *price2Label;//赠品总金额

@property (nonatomic,strong) NSMutableArray *priceArray;

@property (nonatomic,strong) UILabel *discountLabel;//优惠比例

-(void)setDiscountLabel;
@end
