//
//  WarehouseInfoTableViewCell.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WarehouseInfoTableViewCell.h"
#import "Macro.h"

@implementation WarehouseInfoTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self addViews];
    }
    return self;
}

-(void)addViews {
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCBackgroundColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self);
        make.height.equalTo(@(5));
    }];
    
    UILabel *warehouseNmae = [[UILabel alloc]init];
    warehouseNmae.textColor = JCColorMidGray;
    warehouseNmae.font = JCFont14;
    warehouseNmae.text = @"仓库名:";
    [self addSubview:warehouseNmae];
    [warehouseNmae mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(lineView.mas_bottom).offset(10);
    }];
    
    
    _warehouseName = [[UILabel alloc]init];
    _warehouseName.textColor = JCColorBlack;
    _warehouseName.font = JCFont14;
    [self addSubview:_warehouseName];
    [_warehouseName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(warehouseNmae.mas_right).offset(4);
        make.centerY.equalTo(warehouseNmae);
    }];
    
    
    UILabel *adminName =[[UILabel alloc]init];
    adminName.textColor = JCColorMidGray;
    adminName.font = JCFont14;
    adminName.text = @"管理员:";
    [self addSubview:adminName];
    [adminName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(warehouseNmae.mas_bottom).offset(6);
    }];
    
    _adminName = [[UILabel alloc]init];
    _adminName.textColor = JCColorBlack;
    _adminName.font = JCFont14;
    [self addSubview:_adminName];
    [_adminName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(adminName.mas_right).offset(4);
        make.centerY.equalTo(adminName);
    }];
    
    
    UILabel *employeesName = [[UILabel alloc]init];
    employeesName.textColor = JCColorMidGray;
    employeesName.font = JCFont14;
    [self addSubview:employeesName];
    [employeesName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.top.equalTo(adminName.mas_bottom).offset(6);
    }];
    employeesName.text = @"员   工:";
    
    _employeesName = [[UILabel alloc]init];
    _employeesName.textColor = JCColorBlack;
    _employeesName.font = JCFont14;
    [self addSubview:_employeesName];
    [_employeesName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(employeesName.mas_right).offset(4);
        make.centerY.equalTo(employeesName);
    }];
    
}

@end
