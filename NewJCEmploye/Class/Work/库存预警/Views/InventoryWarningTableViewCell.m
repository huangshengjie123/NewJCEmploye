//
//  InventoryWarningTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/30.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "InventoryWarningTableViewCell.h"
#import "Macro.h"
@implementation InventoryWarningTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont15;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.textColor = [UIColor redColor];
    _contentLabel.font = JCFont15;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
    }];
    
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
    
    
    
}

@end
