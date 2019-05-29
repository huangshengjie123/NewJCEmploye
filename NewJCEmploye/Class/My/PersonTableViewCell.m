//
//  PersonTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/4/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "PersonTableViewCell.h"
#import "Macro.h"
@implementation PersonTableViewCell

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
    
    _kImageView = [[UIImageView alloc]init];
    _kImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        make.height.equalTo(@(28));
        make.width.equalTo(@(28));
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont14;
    _contentLabel.textColor = JCColorBlack;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_kImageView.mas_right).offset(10);
        make.centerY.equalTo(self);
    }];
    
    UIImageView *imageView  =[[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"右箭头"];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10);
        make.width.equalTo(@(13));
        make.height.equalTo(@(17));
    }];
    
    UIView *lineView  = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self);
        make.right.equalTo(self);
        make.left.equalTo(self);
        make.height.equalTo(@(1));
    }];

    
}
@end
