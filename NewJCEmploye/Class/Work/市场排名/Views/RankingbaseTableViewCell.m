//
//  RankingbaseTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/27.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "RankingbaseTableViewCell.h"
#import "Macro.h"
@implementation RankingbaseTableViewCell

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
    _titleLabel.font = JCFont16;
    _titleLabel.textColor = JCColorBlack;
    [self addSubview:_titleLabel];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(self);
        make.left.equalTo(self).offset(10);
        
    }];
    
    _contentLabel = [[UILabel alloc]init];
    _contentLabel.font = JCFont14;
    _contentLabel.textColor = JCColorMidGray;
    [self addSubview:_contentLabel];
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.right.equalTo(self).offset(-10);
    }];

}
    

@end
