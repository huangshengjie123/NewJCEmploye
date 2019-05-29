//
//  SearchTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/22.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchViewController.h"
#import "DataModels.h"
@interface SearchTableViewCell : UITableViewCell

@property (nonatomic,strong) UIImageView *kImageView;
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UIButton *button;

- (void)configCellWithModel:(JCModel_employeeInfoData *)model;

@end
