//
//  StockBaseViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/8/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "StockBaseViewController.h"
#import "Macro.h"
#import "StockBaseTableViewCell.h"
#import "NewStockViewController.h"
#import "JCRequest_searchPurchasersAsAppr.h"
#import "DataModels.h"
#import "JCTool.h"
#import "StockDetailsViewController.h"
#import "JCRequest_searchPurchaserOrders.h"
#import "JCRequest_searchPurchasersAsDis.h"
@interface StockBaseViewController () <UITableViewDelegate,UITableViewDataSource,StockDetailsSuccessDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation StockBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addViews];
    
    if ([_identityString  isEqual: @"进货发起人"]) {
        [self readData];
    }
    if ([_identityString  isEqual: @"总公司财务"]) {
        [self readData2];
    }
    
    if ([_identityString isEqualToString:@"总公司配送主管"]) {
        [self readData3];
    }
    
    self.view.backgroundColor = JCBackgroundColor;
}

-(void)addViews {
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 +10);
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
    static NSString *identifier = @"StockBaseTableViewCell";
    // 1.缓存中取
    StockBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[StockBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    
    JCModel_searchPurchaserstabelList *listData = _dataArray[indexPath.row];
    
    cell.nameLabel.text = listData.purchaserDetail.name;
    cell.stateLabel.text = [JCTool changePurchaserOrder:listData.status];
    cell.timeLabel.text = listData.createTime;
    
    if ([listData.type  isEqual: @"recharge"]) {
        cell.typeLabel.text = @"虚拟充值";
    }
    if ([listData.type  isEqual: @"send"]) {
        cell.typeLabel.text = @"实体进货";
    }

    cell.itemLabel.text = @"水管  x 3 , jc-Q5  x 4";
    NSString *str = @"";
    if (listData.purchaserOrderCosts.count >0) {
        for (int i = 0; i < listData.purchaserOrderCosts.count; i ++) {
            
            JCModel_searchPurchaserstabelPurchaserOrderCosts *orderCost = listData.purchaserOrderCosts[i];
            
            str =  [NSString stringWithFormat:@"%@ %@ x %d",str,orderCost.name,(int)orderCost.num];
            
        }
    }
    
    cell.itemLabel.text = str;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_searchPurchaserstabelList *listData = _dataArray[indexPath.row];
    
    
    StockDetailsViewController *vc = [[StockDetailsViewController alloc]init];
    vc.delegate = self;
    vc.listData = listData;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)readData {
    //作为发起人查询
    JCRequest_searchPurchasersAsAppr *request = [[JCRequest_searchPurchasersAsAppr alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchasersAsAppr *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data.list;
        
        [_tableView reloadData];
        NSLog(@">>>>>>>%@",dic);
        
    } failure:^(__kindof JCRequest_searchPurchasersAsAppr *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

//作为财务
-(void)readData2 {
    
    //作为发起人查询
    JCRequest_searchPurchaserOrders *request = [[JCRequest_searchPurchaserOrders alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchaserOrders *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data.list;
        
        [_tableView reloadData];
        NSLog(@">>>>>>>%@",dic);
        
    } failure:^(__kindof JCRequest_searchPurchaserOrders *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

// 作为总公司主管
-(void)readData3 {
    
    //作为发起人查询
    JCRequest_searchPurchasersAsDis *request = [[JCRequest_searchPurchasersAsDis alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"50"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchaserOrders *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data.list;
        
        [_tableView reloadData];
        NSLog(@">>>>>>>%@",dic);
        
    } failure:^(__kindof JCRequest_searchPurchaserOrders *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

//作为总公司配送员
-(void)readData4 {
    
    //作为发起人查询
    JCRequest_searchPurchaserOrders *request = [[JCRequest_searchPurchaserOrders alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchPurchaserOrders *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_searchPurchaserstabelBase *base = [[JCModel_searchPurchaserstabelBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data.list;
        
        [_tableView reloadData];
        NSLog(@">>>>>>>%@",dic);
        
    } failure:^(__kindof JCRequest_searchPurchaserOrders *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}


-(void)buttonAction {
    
    NewStockViewController *newStockVC = [[NewStockViewController alloc]init];
    [self.navigationController pushViewController:newStockVC animated:YES];
    
}


//代理
-(void)takeSellSuccess {
    
    if ([_identityString  isEqual: @"进货发起人"]) {
        [self readData];
    }
    if ([_identityString  isEqual: @"总公司财务"]) {
        [self readData2];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
