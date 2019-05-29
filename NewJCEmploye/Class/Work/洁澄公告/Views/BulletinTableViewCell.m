//
//  BulletinTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BulletinTableViewCell.h"
#import "Macro.h"

@implementation BulletinTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    _kImageView = [[UIImageView alloc]init];
    _kImageView.image = [UIImage imageNamed:@"公告"];
    [self addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(10);
        make.centerY.equalTo(self.mas_centerY);
        make.height.equalTo(@(40));
        make.width.equalTo(@(40));
    }];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = JCFont16;
    _titleLabel.textColor = JCColorBlue;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.left.equalTo(_kImageView.mas_right).offset(10);
        make.top.equalTo(self.mas_top).offset(10);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    _contenlabel =[[UILabel alloc]init];
    _contenlabel.font = JCFont14;
    _contenlabel.textColor = JCColorMidGray;
    [self addSubview:_contenlabel];
    [_contenlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_kImageView.mas_right).offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(6);
        make.right.equalTo(self.mas_right).offset(-10);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = JCFont14;
    _timeLabel.textColor = JCColorMidGray;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_kImageView.mas_right).offset(10);
        make.top.equalTo(self.contenlabel.mas_bottom).offset(6);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
    
    
}
@end
