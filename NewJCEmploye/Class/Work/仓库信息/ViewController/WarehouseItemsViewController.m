//
//  WarehouseItemsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/15.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WarehouseItemsViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "MyItemsTableViewCell.h"
#import "DataModels.h"
#import "JCRequest_ReadStroehouseItems.h"

@interface WarehouseItemsViewController ()<JCSelectViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) JCmodel_StroeHouseItemsBase *base;

@end

@implementation WarehouseItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = [NSString stringWithFormat:@"%@的库存信息",_warehouseName];
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    [self addViews];
    
}

-(void)addViews {
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10, JCScreen_Width, 40) withTitleArray:@[@"设备",@"水",@"配件"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(jcselectView.mas_bottom).offset(10);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"MyItemsTableViewCell";
    MyItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[MyItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    JCmodel_StroeHouseItemsList *itemList = _dataArray[indexPath.row];
    NSArray *itemOneArray = itemList.itemOne;
    
    if (itemOneArray.count != 0)
    {
        JCmodel_StroeHouseItemsItemOne * itemOne = itemOneArray[0];
        cell.titelLabel.text = itemOne.name;
    }
    cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)itemList.num];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return  cell;
    
}

-(void)readData {
    
    JCRequest_ReadStroehouseItems *request = [[JCRequest_ReadStroehouseItems alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"repertory":_warehouseID,
                                @"type":@"2",
                                @"pageNum":pageNum,
                                @"pageSize":pageSize
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadStroehouseItems *request) {
        //
        NSLog(@"成功");
        NSLog(@"%@",request.responseJSONObject);
        NSDictionary *dic = request.rawJSONObject;
        
        _base = [[JCmodel_StroeHouseItemsBase alloc]initWithDictionary:dic];
        
        JCmodel_StroeHouseItemsData *data = _base.data;
        
        _dataArray = data.list;
        
        [self.tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadStroehouseItems *request, NSError *error) {
        
        NSLog(@"失败 %@",error);
        
    }];
}



- (void)buttonAction:(int)buttonNum {
    NSLog( @"%d",buttonNum);
    
    NSString *type = [[NSString alloc]init];
    
    if (buttonNum == 0) {
        type = @"2";
    }
    if (buttonNum == 1) {
        type = @"1";
    }
    if (buttonNum == 2) {
        type = @"3";
    }
    
    
    JCRequest_ReadStroehouseItems *request = [[JCRequest_ReadStroehouseItems alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
//    NSString *userID = [JCTokenManager getUserID];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"repertory":_warehouseID,
                                @"type":type,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadStroehouseItems *request) {
        //
        NSLog(@"成功");
        NSLog(@"%@",request.responseJSONObject);
        NSDictionary *dic = request.rawJSONObject;
        
        _base = [[JCmodel_StroeHouseItemsBase alloc]initWithDictionary:dic];
        JCmodel_StroeHouseItemsData *data = _base.data;
        _dataArray = data.list;
        [self.tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadStroehouseItems *request, NSError *error) {
        
        NSLog(@"失败 %@",error);
        
    }];
    
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
