//
//  TopUpSummaryView.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/20.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "TopUpSummaryView.h"
#import "Macro.h"
#import "DataModels.h"
@implementation TopUpSummaryView

- (void)prepareForContentSubView {
    contentView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc]init];
    label.font = JCFont14;
    label.textColor = JCColorBlack;
    label.text = @"销售清单:";
    [contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(20);
        make.top.equalTo(contentView).offset(20);
    }];
    
    
//    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, (contentView.width - 60)/2, 40)];
//    btn.bottom = contentView.height - 20;
//    [btn setTitle:@"取消" andFont:defaultFont(16) andTitleColor:[UIColor whiteColor] andBgColor:YMSBrandColor andRadius:5];
//    [contentView addSubview:btn];
//    [btn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20, 0, (contentView.width - 40), 40)];
    [button setTitle:@"绑定充值已经完成" andFont:defaultFont(16) andTitleColor:[UIColor whiteColor]  andBgColor:JCColorBlue andRadius:5];
    button.bottom = contentView.height - 20;
    
    [contentView addSubview:button];
    
    
//    UIButton *button = [[UIButton alloc]init];
//    [button setTitle:@"绑定充值完成" andFont:defaultFont(16) andTitleColor:[UIColor whiteColor]  andBgColor:YMSBrandColor andRadius:5];
//    [contentView addSubview:button];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(contentView).offset(-20);
//        make.width.equalTo(@(contentView.width - 40));
//        make.bottom.equalTo(contentView.mas_bottom).offset(-20);
//        make.height.equalTo(@(40));
//    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *lable2 = [[UILabel alloc]init];
    lable2.text = @"卡号:";
    lable2.textColor = JCColorBlack;
    lable2.font = JCFont14;
    [contentView addSubview:lable2];
    [lable2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(20);
        make.bottom.equalTo(button.mas_top).offset(-10);
    }];
    
    _waterCardIDLabel = [[UILabel alloc]init];
    _waterCardIDLabel.textColor = JCColorBlack;
    _waterCardIDLabel.font = JCFont16;
    [contentView addSubview:_waterCardIDLabel];
    [_waterCardIDLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lable2.mas_right).offset(10);
        make.centerY.equalTo(lable2);
    }];
    
    UILabel *lable3 = [[UILabel alloc]init];
    lable3.text = @"客户:";
    lable3.textColor = JCColorBlack;
    lable3.font = JCFont14;
    [contentView addSubview:lable3];
    [lable3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(20);
        make.bottom.equalTo(lable2.mas_top).offset(-10);
    }];
   
    _namelabel = [[UILabel alloc]init];
    _namelabel.textColor = JCColorBlack;
    _namelabel.font = JCFont16;
    [contentView addSubview:_namelabel];
    [_namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lable3.mas_right).offset(10);
        make.centerY.equalTo(lable3);
    }];
    

    _tableView = [[UITableView alloc]init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [contentView addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(contentView);
        make.top.equalTo(label.mas_bottom);
        make.bottom.equalTo(lable3.mas_top).offset(-10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"UITableViewCell";
    // 1.缓存中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_NewProbationOrderJsonCosts *costs = _dataArray[indexPath.row];
    
    cell.textLabel.textColor = JCColorBlack;
    cell.textLabel.font = JCFont13;
    cell.textLabel.text = costs.name;
    [cell.textLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(cell.contentView);
        make.left.equalTo(cell.contentView).offset(20);
    }];
    
    
    UILabel *contentlabel = [[UILabel alloc]init];
    contentlabel.font = JCFont13;
    contentlabel.textColor = JCColorBlack;
    contentlabel.text = [NSString stringWithFormat:@"x%d",(int)costs.num];
    [cell.contentView addSubview:contentlabel];
    [contentlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(cell.textLabel.mas_right).offset(115);
    }];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

-(void)buttonAction {
    
    [self.delegate2 totalCompleted];
    
    [self hide];
    
}



@end
