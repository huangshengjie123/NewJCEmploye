//
//  WorkDataTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WorkDataTableViewCell.h"
#import "Macro.h"
@implementation WorkDataTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
        self.backgroundColor = JCColorWithe ;
    }
    return self;
}

-(void)addViews {
    
        UILabel *label1 = [[UILabel alloc]init];
        label1.textColor = JCColorBlack;
        label1.font = JCFont14;
        [self addSubview:label1];
        [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(25);
            make.centerY.equalTo(self);
        }];
        _contentLabel1 = label1;
    
        UILabel *nameLabel2 = [[UILabel alloc]init];
        nameLabel2.textColor = JCColorBlack;
        nameLabel2.font = JCFont14;
        [self addSubview:nameLabel2];
        [nameLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo (self.mas_centerX).offset(-55);
            make.centerY.equalTo(self);
        }];
        _contentLabel2 = nameLabel2;
    
    
        UILabel *namelabel5 = [[UILabel alloc]init];
        namelabel5.textColor = JCColorBlack;
        namelabel5.font = JCFont14;
        [self addSubview:namelabel5];
        [namelabel5 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.centerX.equalTo(self);
        }];
        _contentLabel5 = namelabel5;
        
    
        UILabel *nameLabel3= [[ UILabel alloc]init];
        nameLabel3.textColor = JCColorBlack;
        nameLabel3.font = JCFont14;
        [self addSubview:nameLabel3];
        [nameLabel3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_centerX).offset(55);
            make.centerY.equalTo(self);
        }];
        _contentLabel3 = nameLabel3;
    
    
        UILabel *nameLabel4 = [[UILabel alloc]init];
        nameLabel4.textColor = JCColorBlack;
        nameLabel4.font = JCFont14;
        [self addSubview:nameLabel4];
        [nameLabel4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.mas_right).offset(-30);
            make.centerY.equalTo(self);
        }];
        _contentLabel4 = nameLabel4;
    
    
}

@end
