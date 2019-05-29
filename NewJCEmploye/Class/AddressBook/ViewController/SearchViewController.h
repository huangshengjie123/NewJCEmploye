//
//  SearchViewController.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  通讯录搜索之后的界面

#import "BaseViewController.h"


typedef void(^SelectedItem)(NSString *item);

@interface SearchViewController : BaseViewController

@property (strong, nonatomic) SelectedItem block;
@property (nonatomic,strong)  NSArray *userDataArray;

- (void)didSelectedItem:(SelectedItem)block;

@end
