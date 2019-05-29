//
//  NewWorkLogTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewWorkLogTableViewCell.h"
#import "Macro.h"
@implementation NewWorkLogTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.text = @"2018-08-10 11:04:00";
    _timeLabel.font = JCFont12;
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.numberOfLines = 2;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.width.equalTo(@(80));
        make.centerY.equalTo(self);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont14;
    _contentLabel.textColor = JCColorBlack;
    _contentLabel.numberOfLines = 0;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_timeLabel.mas_right).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.bottom.equalTo(self.mas_bottom).offset(-10);
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
