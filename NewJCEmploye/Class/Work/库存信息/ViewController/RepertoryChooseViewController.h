//
//  RepertoryChooseViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  库存选择

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "DataModels.h"

@protocol SelectItemsDelegate <NSObject>

@optional

-(void)selectItemsReturn:(NSArray *)myItemArray withTypestring:(NSString *)typeString;

-(void)selectRepertoryItems:(NSArray *)repertoryItemArray withTypestring:(NSString *)typeString withStoreHourse:(NSString *)storeHourse;


@end

@interface RepertoryChooseViewController : BaseViewController


@property (nonatomic,strong) NSString  *typeString;
@property (nonatomic, weak)  id<SelectItemsDelegate> delegate;
@property (nonatomic,strong) NSString  *warehouseString;
@property (nonatomic,strong) NSString  *warehouseId;
@property (nonatomic,assign) BOOL      isSimpleOutbound;
@property (nonatomic,strong) NSString  *inputString;
@property (nonatomic,strong) NSString  *selfItemString;

@end
