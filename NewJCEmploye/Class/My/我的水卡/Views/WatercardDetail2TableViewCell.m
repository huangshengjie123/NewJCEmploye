//
//  WatercardDetail2TableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/23.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WatercardDetail2TableViewCell.h"
#import "Macro.h"

@implementation WatercardDetail2TableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
 
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = JCFont15;
    _titleLabel.textColor = JCColorBlack;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
    }];
    
    _contenLabel = [[UILabel alloc]init];
    _contenLabel.textColor = JCColorBlack;
    _contenLabel.font = JCFont15;
    [self addSubview:_contenLabel];
    [_contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
}

@end
