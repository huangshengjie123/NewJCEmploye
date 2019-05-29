//
//  DistributionLeaderTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DistributionLeaderTableViewCell.h"
#import "Macro.h"
@implementation DistributionLeaderTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.backgroundColor = JCColorWithe;
    }
    return self;
}

-(void)addViews {
    
    _carNameLabel = [[UILabel alloc]init];
    _carNameLabel.font = JCFont15;
    _carNameLabel.textColor = JCColorBlue;
    [self addSubview:_carNameLabel];
    [_carNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont15;
    _contentLabel.textColor = JCColorBlack;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(5));
    }];
    
    
    _selectButton = [[UIButton alloc]init];
    _selectButton.backgroundColor = [UIColor clearColor];
    [self addSubview:_selectButton];
    [_selectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.top.bottom.equalTo(self);
        make.width.equalTo(@(110));
    }];
    
    UILabel *titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"选择配送员";
    titleLabel.font = JCFont14;
    titleLabel.textColor = JCColorBlack;
    [_selectButton addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(_selectButton);
    }];
    
    
}
@end
