//
//  NewDistributionTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewDistributionTableViewCell.h"
#import "Macro.h"
@implementation NewDistributionTableViewCell

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
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont15;
    [self addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(8);
    }];
    
    _typeLabel = [[UILabel alloc]init];
    _typeLabel.textColor = JCColorBlue;
    _typeLabel.font = JCFont15;
    [self addSubview:_typeLabel];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_nameLabel.mas_right).offset(10);
        make.centerY.equalTo(_nameLabel);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.textColor = JCColorBlack;
    _phoneLabel.font = JCFont15;
    [self addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(_typeLabel);
    }];
    
    UIView *lineView1 = [[UIView alloc]init];
    lineView1.backgroundColor = JCColorGray;
    [self addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_phoneLabel.mas_bottom).offset(8);
        make.left.right.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorMidGray;
    _timeLabel.font = JCFont15;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView1.mas_bottom).offset(7);
    }];
    
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.numberOfLines = 0;
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont15;
    [self addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_timeLabel.mas_bottom).offset(7);
    }];
    
    
    _itemsLabel = [[UILabel alloc]init];
    _itemsLabel.textColor = JCColorBlack;
    _itemsLabel.font = JCFont15;
    [self addSubview:_itemsLabel];
    [_itemsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_addressLabel.mas_bottom).offset(7);
    }];
    
    UIView *line2View = [[UILabel alloc]init];
    line2View.backgroundColor = JCBackgroundColor;
    [self addSubview:line2View];
    [line2View mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.equalTo(self);
        make.height.equalTo(@(5));
        make.top.equalTo(_itemsLabel.mas_bottom).offset(7);
        make.bottom.equalTo(self);
    }];
    
}

@end
