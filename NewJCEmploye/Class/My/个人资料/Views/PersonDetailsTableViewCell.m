//
//  PersonDetailsTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "PersonDetailsTableViewCell.h"
#import "Macro.h"
@implementation PersonDetailsTableViewCell

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
    _titleLabel.font = JCFont14;
    _titleLabel.textColor = JCColorBlack;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
    }];
    
    _kImageView = [[UIImageView alloc]init];
    [self addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
        make.height.equalTo(@(50));
        make.width.equalTo(@(50));
    }];
    _kImageView.hidden = YES;
    
    _arrowImageView = [[UIImageView alloc]init];
    [_arrowImageView setImage:[UIImage imageNamed:@"右箭头"]];
    [self addSubview:_arrowImageView];
    [_arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.equalTo(@(13));
        make.height.equalTo(@(16));
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.textColor = JCColorBlack;
    _contentLabel.font = JCFont14;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(_arrowImageView.mas_left).offset(-5);
        make.left.equalTo(_titleLabel.mas_right).offset(10);
    }];
    
    _textField = [[UITextField alloc]init];
    [self addSubview:_textField];
    [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).offset(-10);
        make.centerY.equalTo(self);
    }];
    _textField.hidden = YES;
    _textField.textAlignment = NSTextAlignmentRight;

    
    UIView *line = [[UIView alloc]init];
    line.backgroundColor = JCBackgroundColor;
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];
    
}
@end
