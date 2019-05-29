//
//  CleanWaterTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/20.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CleanWaterTableViewCell.h"
#import "Macro.h"
@implementation CleanWaterTableViewCell


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
 
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.font = JCFont14;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(6);
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(_timeLabel.mas_bottom).offset(6);
        make.height.equalTo(@(1));
    }];
    
    _contentLabel1 = [[UILabel alloc]init];
    _contentLabel1.font = JCFont14;
    _contentLabel1.textColor = JCColorBlack;
    [self addSubview:_contentLabel1];
    [_contentLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(6);
        make.right.equalTo(self).offset(-10);
    }];
    
    _contentLabel2 = [[UILabel alloc]init];
    _contentLabel2.font = JCFont14;
    _contentLabel2.textColor = JCColorBlack;
    [self addSubview:_contentLabel2];
    [_contentLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_contentLabel1.mas_bottom).offset(6);
        make.right.equalTo(self).offset(-10);
    }];
    
    _contentLabel3 = [[UILabel alloc]init];
    _contentLabel3.font = JCFont14;
    _contentLabel3.textColor = JCColorBlack;
    [self addSubview:_contentLabel3];
    [_contentLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_contentLabel2.mas_bottom).offset(6);
        make.right.equalTo(self).offset(-10);
    }];
    
    UIView *lineView2 = [[UIView alloc]init];
    lineView2.backgroundColor = JCColorGray;
    [self addSubview:lineView2];
    [lineView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(5));
    }];
    
}

@end
