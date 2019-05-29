//
//  WorkLogTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkLogTableViewCell.h"
#import "Macro.h"
@implementation WorkLogTableViewCell

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
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.font = [UIFont boldSystemFontOfSize:20];
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(10);
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

-(void)addContentLabel {
    
    _contenLabel = [[UILabel alloc]init];
    _contenLabel.textColor = JCColorMidGray;
    _contenLabel.font = JCFont14;
    [self addSubview:_contenLabel];
    [_contenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.top.equalTo(_timeLabel.mas_bottom).offset(7);
    }];
    
}
@end
