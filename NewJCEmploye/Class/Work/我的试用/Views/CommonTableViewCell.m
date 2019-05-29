//
//  CommonTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CommonTableViewCell.h"
#import "Macro.h"
@implementation CommonTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
 
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor = JCColorBlack;
    _titleLabel.font = JCFont14;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.textColor = JCColorBlack;
    _contentLabel.font = JCFont14;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo (_titleLabel.mas_right).offset(10);
        make.centerY.equalTo(_titleLabel);
    }];
    
}
@end
