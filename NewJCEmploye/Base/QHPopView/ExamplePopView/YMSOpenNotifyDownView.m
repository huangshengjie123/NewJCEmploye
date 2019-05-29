//
//  YMSOpenNotifyDownView.m
//  yimashuo
//
//  Created by imqiuhang on 15/12/18.
//  Copyright © 2015年 imqiuhang. All rights reserved.
//

#import "YMSOpenNotifyDownView.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRequest_GetItemPrice.h"
@implementation YMSOpenNotifyDownView

- (void)prepareForContentSubView {
    contentView.backgroundColor = [UIColor whiteColor];
//
    UILabel *label = [[UILabel alloc]init];
    label.font = JCFont14;
    label.textColor = JCColorBlack;
    [contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(20);
        make.top.equalTo(contentView).offset(0);
        make.height.equalTo(@(1));
    }];
    
   _priceArray = [NSMutableArray arrayWithCapacity:20];

    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 0, (contentView.width - 60)/2, 40)];
    btn.bottom = contentView.height - 20;
    [btn setTitle:@"取消" andFont:defaultFont(16) andTitleColor:[UIColor whiteColor] andBgColor:YMSBrandColor andRadius:5];
    [contentView addSubview:btn];
    [btn addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(20+ (contentView.width)/2, 0, (contentView.width - 60)/2, 40)];
    [button setTitle:@"确定" andFont:defaultFont(16) andTitleColor:[UIColor whiteColor]  andBgColor:JCColorBlue andRadius:5];
    button.bottom = contentView.height - 20;

    [contentView addSubview:button];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(contentView.mas_right).offset(-20);
//        make.width.equalTo(@( (contentView.width - 60)/2));
//        make.bottom.equalTo(contentView.mas_bottom).offset(-20);
//        make.height.equalTo(@(40));
//    }];
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.font = JCFont14;
    label1.textColor = JCColorBlack;
    label1.text = @"商品:";
    [contentView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(20);
        make.bottom.equalTo(btn.mas_top).offset(-10);
    }];
    
    _label2 = [[UILabel alloc]init];
    _label2.font  = JCFont15;
    _label2.textColor =  [UIColor redColor];
    _label2.text = _totalSring;
    [contentView addSubview:_label2];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1);
        make.left.equalTo(label1.mas_right).offset(5);
    }];
    
    
    UILabel *label4=[[UILabel alloc]init];
    label4.text = @"赠品:";
    label4.textColor = JCColorBlack;
    label4.font = JCFont14;
    [contentView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label2.mas_right).offset(5);
        make.centerY.equalTo(_label2);
    }];
    
    _price2Label = [[UILabel alloc]init];
    _price2Label.font = JCFont15;
    _price2Label.textColor = [UIColor redColor];
    [contentView addSubview:_price2Label];
    [_price2Label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label4);
        make.left.equalTo(label4.mas_right).offset(5);
    }];
    
    UILabel *label5 =[[UILabel alloc]init];
    label5.font = JCFont14;
    label5.textColor = JCColorBlack;
    label5.text = @"比例:";
    [contentView addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label4);
        make.left.equalTo(_price2Label.mas_right).offset(5);
    }];

    _discountLabel = [[UILabel alloc]init];
    _discountLabel.font = JCFont14;
    _discountLabel.textColor = [UIColor redColor];
    [contentView addSubview:_discountLabel];
    [_discountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label5);
        make.left.equalTo(label5.mas_right).offset(5);
    }];
    
    
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"套餐:";
    label3.font = JCFont14;
    label3.textColor = JCColorBlack;
    [contentView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(contentView).offset(20);
        make.bottom.equalTo(label1.mas_top).offset(-10);
    }];
    
    _packgeLabel = [[UILabel alloc]init];
    _packgeLabel.font = JCFont14;
    _packgeLabel.textColor = JCColorBlack;
    [contentView addSubview:_packgeLabel];
    [_packgeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).offset(10);
        make.centerY.equalTo(label3);
    }];
  
    
   
    
//    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, contentView.width, contentView.height-110)];
//    _tableView.dataSource = self;
//    _tableView.delegate = self;
//    [contentView addSubview:_tableView];
//    _tableView.top = -45;
//
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView = [[UITableView alloc]init];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [contentView addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(contentView);
        make.top.equalTo(label.mas_top).offset(0);
        make.bottom.equalTo(label1.mas_top).offset(0);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0) {
        return _dataArray.count;
    }else {
        
        for (int i = 0; i < _data2Array.count; i ++) {
            JCModel_NewProbationOrderJsonCosts *costs = _data2Array[i];
            
            
            [self readItemPrice:[NSString stringWithFormat:@"%d",(int)costs.item] and:(int)costs.num];
            
        }
        
        return _data2Array.count;
    }
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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
    
    if (indexPath.section == 0) {
        
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
        contentlabel.text = [NSString stringWithFormat:@"x %d",(int)costs.num];
        [cell.contentView addSubview:contentlabel];
        [contentlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.textLabel.mas_left).offset(200);
        }];
        return cell;
    }else {
        JCModel_NewProbationOrderJsonCosts *costs = _data2Array[indexPath.row];
        
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
        contentlabel.text = [NSString stringWithFormat:@"x %d",(int)costs.num];
        [cell.contentView addSubview:contentlabel];
        [contentlabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(cell.textLabel.mas_left).offset(200);
        }];
        return cell;
    }
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
  
        
        UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
        view.backgroundColor = [UIColor clearColor];
        
        UILabel *label = [[UILabel alloc]init];
        label.font = [UIFont systemFontOfSize:14];
        label.textColor = JCColorBlue;
        [view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(view).offset(20);
            make.centerY.equalTo(view);
        }];
    
    
    if (_data2Array.count != 0) {
        if (section == 1) {
            
            label.text = @"赠品清单";
        }
    }
    
        return view ;
        
    
}

-(void)readItemPrice:(NSString *)itemID  and:(int)num {
    
    JCRequest_GetItemPrice *request = [[JCRequest_GetItemPrice alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]init];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":itemID,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_GetItemPrice *request) {
        //
        NSLog(@"成功");
        NSDictionary * dic = request.responseJSONObject;
        JCModel_GetItemPriceBase *base = [[JCModel_GetItemPriceBase alloc]initWithDictionary:dic];
        
        int  price = (int)base.data.price * num;
        
        
        
        [_priceArray addObject:[NSString stringWithFormat:@"%d",price]];
        
      
      
        if (_priceArray.count == _data2Array.count) {
            int a = 0;
            for (NSString *b in _priceArray) {
                a = [b intValue]+a;
                
            }
            
            _price2Label.text = [NSString stringWithFormat:@"%d",a];
            
            float x = _price2Label.text.floatValue;
            float y = _label2.text.floatValue;
            
            float z = (x / y) * 100;
            
            
            
            _discountLabel.text = [NSString stringWithFormat:@"%.1f%%",z];
            
        }
            
        
        
        
        
    } failure:^(__kindof JCRequest_GetItemPrice *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(void)setDiscountLabel {
    
}
-(void)didMoveToSuperview {
    
   

}

-(void)didMoveToWindow {
    
}


-(void)buttonAction {
    
    [self.delegate2 totalCompleted:_label2.text];
    
    [self hide];
    
}

@end
