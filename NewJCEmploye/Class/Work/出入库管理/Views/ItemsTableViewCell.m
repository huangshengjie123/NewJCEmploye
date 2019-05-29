//
//  ItemsTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ItemsTableViewCell.h"
#import "Macro.h"
@implementation ItemsTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
 
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont14;
    _contentLabel.textColor = JCColorBlack;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
    }];
    
    _numberLabel = [[UILabel alloc]init];
    _numberLabel.font = JCFont14;
    _numberLabel.textColor = JCColorBlack;
    [self addSubview:_numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10);
    }];
}

@end
