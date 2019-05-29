//
//  ProbationCustomTableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"
@interface ProbationCustomTableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong)JCModel_GetCustmerData *data;
@property (nonatomic,strong) UIButton *button;


@end
