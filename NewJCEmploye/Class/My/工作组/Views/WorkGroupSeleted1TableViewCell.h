//
//  WorkGroupSeleted1TableViewCell.h
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WorkGroupSeleted1TableViewCell : UITableViewCell

@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UIImageView *kImageView;
@property (nonatomic,assign) BOOL isSeleted;//被选中
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) NSString *sringId;

@end
