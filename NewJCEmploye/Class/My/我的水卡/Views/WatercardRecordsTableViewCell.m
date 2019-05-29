//
//  WatercardRecordsTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WatercardRecordsTableViewCell.h"
#import "Macro.h"
@implementation WatercardRecordsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        
    }
    return self;
}

-(void)addViews {
    _typeLabel = [[UILabel alloc]init];
    _typeLabel.font = JCFont15;
    [self addSubview:_typeLabel];
    [_typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(self).offset(8);
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = JCFont15;
    _timeLabel.textColor = JCColorMidGray;
    [self addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_typeLabel);
        make.right.equalTo(self).offset(-10);
    }];
    
    _itemsLabel = [[UILabel alloc]init];
    _itemsLabel.textColor = JCColorBlack;
    _timeLabel.font = JCFont15;
    [self addSubview:_itemsLabel];
    [_itemsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.left.equalTo(self).offset(10);
        make.top.equalTo(_timeLabel.mas_bottom).offset(8);
    }];
    
    UIView *lineView =[[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(5));
    }];
}

@end
