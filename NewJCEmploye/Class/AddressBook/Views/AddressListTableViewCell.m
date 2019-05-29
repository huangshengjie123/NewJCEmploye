//
//  AddressListTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "AddressListTableViewCell.h"
#import "Macro.h"
@implementation AddressListTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.backgroundColor = JCBackgroundColor;
    }
    return self;
}

-(void)addViews {
    
    UIView *backView = [[UIView alloc]init];
    backView.backgroundColor = JCColorWithe;
    [self addSubview:backView];
    [backView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.mas_top).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-3);
        
    }];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.font = JCFont14;
    _titleLabel.textColor = JCColorBlack;
    [backView addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.centerY.equalTo(self);
    }];
    
    _numLabel = [[UILabel alloc]init];
    _numLabel.font = JCFont14;
    _numLabel.textColor = JCColorBlack;
    [backView addSubview:_numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel.mas_right);
        make.centerY.equalTo(self.titleLabel);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"右箭头"];
    [backView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.equalTo(@(13));
        make.height.equalTo(@(18));
    }];
}
@end
