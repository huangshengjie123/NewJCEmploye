//
//  CategoryTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import "Macro.h"

@implementation CategoryTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    _categoryTitleLabel = [[UILabel alloc]init];
    _categoryTitleLabel.font = JCFont14;
    _categoryTitleLabel.textColor = JCColorBlack;
    [self addSubview:_categoryTitleLabel];
    [_categoryTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.centerY.equalTo(self);
    }];
    
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.image = [UIImage imageNamed:@"右箭头"];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self.mas_right).offset(-10);
        make.width.equalTo(@(13));
        make.height.equalTo(@(18));
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = GrayColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.bottom.equalTo(self);
        make.height.equalTo(@(1));
    }];

}

@end
