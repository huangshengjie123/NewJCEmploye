//
//  AdaptiveTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/18.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "AdaptiveTableViewCell.h"
#import "Macro.h"
@implementation AdaptiveTableViewCell

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
//        make.top.equalTo(self).offset(10);
    }];
    
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
        make.left.equalTo(_titleLabel.mas_right).offset(10);
        make.right.equalTo(self.mas_right).offset(-28);
        make.top.equalTo(self).offset(10);
        make.bottom.equalTo(self).offset(-10);
    }];
    _contentLabel.textAlignment = NSTextAlignmentRight;
    _contentLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    _contentLabel.numberOfLines = 0;
}

@end
