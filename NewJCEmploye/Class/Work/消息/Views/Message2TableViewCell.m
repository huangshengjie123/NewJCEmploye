//
//  Message2TableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/14.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "Message2TableViewCell.h"
#import "Macro.h"
@implementation Message2TableViewCell

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
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = JCColorBlue;
    _titleLabel.font = JCFont15;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(8);
        make.left.equalTo(self).offset(10);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorMidGray;
    _timeLabel.font = JCFont12;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(_titleLabel);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.textColor  = JCColorBlack;
    _contentLabel.font = JCFont15;
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.right.equalTo(self).offset(-10);
        make.top.equalTo(_titleLabel.mas_bottom).offset(8);
        make.bottom.equalTo(self).offset(-8);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(1));
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
    }];
    
    
    
    
    
    
}

@end
