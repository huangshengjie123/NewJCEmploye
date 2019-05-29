//
//  MyCooperationPointViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  我的合作点

#import "MyCooperationPointViewController.h"
#import "Macro.h"
#import "SellTableViewCell.h"
#import "DataModels.h"
#import "NewCooperationPointViewController.h"
#import "Request_readMyWarehouse.h"
#import "SGActionView.h"
#import "JCRequest_searchCooPointOrder.h"
#import "CooperationDetailedViewController.h"

@interface MyCooperationPointViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,NewCooperationPointSuccessDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *warehouseArray;

@end

@implementation MyCooperationPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"合作点";
    self.view.backgroundColor = JCBackgroundColor;
    
    [self addViews];
    [self readMywarehouse];
    [self readData];
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(functionalButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索合作单";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(-0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(36));
    }];
    _searchBar.delegate = self;
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.searchBar.mas_bottom);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

}

-(void)functionalButtonAction {
    
    NewCooperationPointViewController *vc = [[NewCooperationPointViewController alloc]init];

    NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i<_warehouseArray.count; i++)
    {
        JCModel_MyWarehouseData *data = _warehouseArray[i];
        [array addObject:data.name];
    }
    
    [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        vc.warehouseString = array[index];
        JCModel_MyWarehouseData *data =   _warehouseArray[index];
        vc.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
        [self.navigationController pushViewController:vc animated:YES];
        
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"SellTableViewCell";
    // 1.缓存中取
    SellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[SellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    JCModel_CooperationPoiontOrderList *list = _dataArray[indexPath.row];
    NSLog(@"%@",list);
    cell.nameLabel.text = list.cooPointSimp.pointName;
    cell.phoneLabel.text = list.cooPointSimp.pointPhone;
    cell.addressLabel.text = list.cooPointSimp.pointAddr;
    cell.timeLabel.text = list.createTime;
    NSString *itemString = @"";
    
    for (int i = 0; i< list.cooPointOrderCosts.count; i ++)
    {
        JCModel_probationOrderProbationCosts *cost  = list.cooPointOrderCosts[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,cost.name,(int)cost.num];
    }
    for (int i = 0; i < list.items.count; i ++)
    {
        JCModel_SellOrderOrderPresents *present = list.items[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,present.name,(int)present.num];
    }
    
    cell.itemsLabel.text = itemString;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_CooperationPoiontOrderList *list = _dataArray[indexPath.row];
    CooperationDetailedViewController *vc = [[CooperationDetailedViewController alloc]init];
    vc.list = list;
    [self.navigationController pushViewController:vc animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//先查自己所在仓库
-(void)readMywarehouse {
    Request_readMyWarehouse *request = [[Request_readMyWarehouse alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    [request startWithBlockSuccess:^(__kindof Request_readMyWarehouse *request) {
        //
        NSLog(@"成功获取自己仓库");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_MyWarehouseBase *base = [[JCModel_MyWarehouseBase alloc]initWithDictionary:dic];
        _warehouseArray = base.data;
        
        
        //在刷新前清空 所有储存的cell
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
}
-(void)readData {
    JCRequest_searchCooPointOrder *request = [[JCRequest_searchCooPointOrder alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *userID = [JCTokenManager getUserID];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"guide":userID
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchCooPointOrder *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_CooperationPoiontOrderBase *base = [[JCModel_CooperationPoiontOrderBase alloc]initWithDictionary:dic];
        
        JCModel_CooperationPoiontOrderData *data = [[JCModel_CooperationPoiontOrderData alloc]init];
        data = base.data;
        
        _dataArray = data.list;
        
        [self.tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchCooPointOrder *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
    
}


-(void)NewCooperationPoint111 {
    
    [self showInfo:@"创建成功"];
    [self.tableView reloadData];
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
