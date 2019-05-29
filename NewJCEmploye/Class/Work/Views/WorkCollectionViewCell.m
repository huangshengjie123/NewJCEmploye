//
//  WorkCollectionViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkCollectionViewCell.h"
#import "Macro.h"

@implementation WorkCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    _kImageView = [[UIImageView alloc]init];
    _kImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_kImageView];
    [_kImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.mas_top).offset(8);
        make.width.mas_equalTo(46);
        make.height.mas_equalTo(46);
    }];
    
    _titleLabel = [[UILabel alloc]init];
    _titleLabel.textColor =  BlackColor;
    _titleLabel.font = JCFont12;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_kImageView);
        make.top.equalTo(_kImageView.mas_bottom).offset(7);
    }];
}

@end
