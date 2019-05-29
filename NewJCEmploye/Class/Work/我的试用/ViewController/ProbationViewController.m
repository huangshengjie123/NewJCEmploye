//
//  ProbationViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/7.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ProbationViewController.h"
#import "Macro.h"
#import "ProbationTableViewCell.h"
#import "NewProbationViewController.h"
#import "ProbationDetailsViewController.h"
#import "JCRequest_readMyProbationOrder.h"
#import "DataModels.h"
#import "JCRequest_NewProbationOrder.h"
#import "AFNetworking.h"
#import "SGActionView.h"
#import "Request_readMyWarehouse.h"
#import "JCRequest_getProbations4Group1.h"
#import "JCSelectView.h"
#import "JCRequest_readStatisticalReportsOrders.h"

@interface ProbationViewController ()<UITableViewDelegate,UITableViewDataSource,NewProbationSuccessDelegate,UISearchBarDelegate,ProbationDetailsSuccessDelegate,JCSelectViewDelegate>

@property (nonatomic,strong) UISearchBar  *searchBar;
@property (nonatomic,strong) UITableView  *tableView;
@property (nonatomic,strong) NSArray      *warehouseArray;
@property (nonatomic,strong) NSArray      *dataArray;


@end

@implementation ProbationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"试用";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readMywarehouse];

    if (_uID.length > 0)
    {
        if ([_sring  isEqual: @"工作组统计"])
        {
            if (_isAll == YES)
            {
                [self readData33];
            }
            else
            {
                [self readData3];
            }
        }
        else
        {
            [self readData22];
        }
    }
    else
    {
        [self readMyData];
        UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
        [informationCardBtn sizeToFit];
        UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
        self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    }
}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索试用单(包含历史试用)";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(-0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(36));
    }];
    _searchBar.delegate = self;
    
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10 + 40, JCScreen_Width, 40) withTitleArray:@[@"试用中",@"已试用"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(jcselectView.mas_bottom);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

#pragma mark - UItableview代理

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ProbationTableViewCell";
    ProbationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[ProbationTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_probationOrderList * list = _dataArray[indexPath.row];
    cell.probationerNameLabel.text = list.customer.name;
    cell.probationerPhoneLabel.text = list.customer.phone;
    cell.probationStartTimeLabel.text = list.start;
    cell.probationAddressLabel.text =list.customer.address;
    cell.probationStateLabel.text = [JCTool determinesProbationStatusSringWith:list.status];
    NSString *itemString = @"";
    
    for (int i = 0; i< list.probationCosts.count; i ++)
    {
        JCModel_probationOrderProbationCosts *cost  = list.probationCosts[i];
        itemString = [NSString stringWithFormat:@"%@ %@ x  %d",itemString,cost.name,(int)cost.num];
    }
    cell.probationItemsLabel.text = itemString;
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 130;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_uID.length > 0)
    {
        JCModel_probationOrderList * list = _dataArray[indexPath.row];
        ProbationDetailsViewController *probationDeatilsVC = [[ProbationDetailsViewController alloc]init];
        probationDeatilsVC.probationOrderList = list;
        
        probationDeatilsVC.isReadOfLeader = YES;
        [self.navigationController pushViewController:probationDeatilsVC animated:YES];
    
    }
    else
    {
        
        JCModel_probationOrderList * list = _dataArray[indexPath.row];
        ProbationDetailsViewController *probationDeatilsVC = [[ProbationDetailsViewController alloc]init];
        probationDeatilsVC.probationOrderList = list;
        probationDeatilsVC.delegate = self;
        [self.navigationController pushViewController:probationDeatilsVC animated:YES];
    }
    
    
   
}
//读取组内人员的试用单
-(void)readData22{
    
    JCRequest_getProbations4Group1 *request = [[JCRequest_getProbations4Group1 alloc]init];
    
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
                                @"guide":_uID,
                                @"groupId":_gID
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getProbations4Group1 *request) {
        //
        NSLog(@"成功获取试用单");
        NSDictionary *dic =  request.rawJSONObject;
        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
        JCModel_probationOrderData *data = base.data;
        
        
        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < data.list.count; i++) {
            JCModel_probationOrderList * list = data.list[i];
            if (![list.status  isEqual: @"completed"]) {
                [dataArray1 addObject:list];
            }
        }
        _dataArray = dataArray1;

        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getProbations4Group1 *request, NSError *error) {
        NSLog(@"失败获取试用单 %@",error);
    }];
}

 
//读取我的试用数据
-(void)readMyData {
    
    JCRequest_readMyProbationOrder *request = [[JCRequest_readMyProbationOrder alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_readMyProbationOrder *request) {
        //
        NSLog(@"成功获取试用单");
        NSDictionary *dic =  request.rawJSONObject;
        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
        JCModel_probationOrderData *data = base.data;
        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < data.list.count; i++) {
            JCModel_probationOrderList * list = data.list[i];
            if (![list.status  isEqual: @"completed"]) {
                [dataArray1 addObject:list];
            }
        }
        _dataArray = dataArray1;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readMyProbationOrder *request, NSError *error) {
        NSLog(@"失败获取试用单 %@",error);
    }];

}

-(void)buttonAction {
    
    NewProbationViewController *newProbationVC = [[NewProbationViewController alloc]init];
    newProbationVC.delegate = self;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i<_warehouseArray.count; i++)
    {
        JCModel_MyWarehouseData *data = _warehouseArray[i];
        [array addObject:data.name];
    }
    
    [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        newProbationVC.warehouseString = array[index];
        JCModel_MyWarehouseData *data = _warehouseArray[index];
        newProbationVC.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
        [self.navigationController pushViewController:newProbationVC animated:YES];
        
    }];
    
}
-(void)readdata333 {
    
    
    JCRequest_getProbations4Group1 *request = [[JCRequest_getProbations4Group1 alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"%d",_allNum];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"groupId":_gID,
                                @"cycle":_cycleSring,
                                @"crerteTime":_time,
                                @"noStop":@"stop"
                                };
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getProbations4Group1 *request) {
        //
        NSLog(@"成功获取试用单");
        
        NSDictionary *dic =  request.rawJSONObject;
        NSLog(@"%@",dic);
        
        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
        JCModel_probationOrderData *data = base.data;

        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < data.list.count; i++) {
            JCModel_probationOrderList * list = data.list[i];
            if ([list.status  isEqual: @"completed"]) {
                [dataArray1 addObject:list];
            }
        }
        _dataArray = dataArray1;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getProbations4Group1 *request, NSError *error) {
        NSLog(@"失败获取试用单 %@",error);
    }];

}

-(void)readData33 {
    
    
    //读取工作组中传来的时间，相关数据
    JCRequest_getProbations4Group1 *request = [[JCRequest_getProbations4Group1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"%d",_allNum];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"groupId":_gID,
                                @"cycle":_cycleSring,
                                @"crerteTime":_time,
                                @"noStop":@"stop"
                                };
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getProbations4Group1 *request) {
        //
        NSLog(@"成功获取试用单");
        
        NSDictionary *dic =  request.rawJSONObject;
         NSLog(@"%@",dic);
      
        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
        JCModel_probationOrderData *data = base.data;
        
        
        
        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < data.list.count; i++) {
            JCModel_probationOrderList * list = data.list[i];
            if (![list.status  isEqual: @"completed"]) {
                [dataArray1 addObject:list];
            }
        }
        _dataArray = dataArray1;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getProbations4Group1 *request, NSError *error) {
        NSLog(@"失败获取试用单 %@",error);
    }];
}

-(void)readData3 {
    
    //读取工作组中传来的时间，相关数据
    JCRequest_readStatisticalReportsOrders *request = [[JCRequest_readStatisticalReportsOrders alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"%d",_allNum];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"guide":_uID,
                                @"cycle":_cycleSring,
                                @"crerteTime":_time,
                                @"noStop":@"stop"
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readStatisticalReportsOrders *request) {
        //
        NSLog(@"成功获取试用单");
        NSDictionary *dic =  request.rawJSONObject;
        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
        JCModel_probationOrderData *data = base.data;
        
        
        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
        for (int i = 0; i < data.list.count; i++) {
            JCModel_probationOrderList * list = data.list[i];
            if (![list.status  isEqual: @"completed"]) {
                [dataArray1 addObject:list];
            }
        }
        _dataArray = dataArray1;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readStatisticalReportsOrders *request, NSError *error) {
        NSLog(@"失败获取试用单 %@",error);
    }];
}


-(void)buttonAction:(int)buttonNum {
    
    
    if ([_sring isEqual:@"工作组统计"])
    {
        if (_isAll == YES)
        {
            if (buttonNum == 0)
            {
                [self readData33];
            }
            
            if (buttonNum == 1)
            {
                [self readdata333];
            }
        }
    }
    else
    {
        if (_uID.length > 0)
        {
            if ([_sring  isEqual: @"工作组统计"])
            {
                if (buttonNum == 0)
                {
                    JCRequest_readStatisticalReportsOrders *request = [[JCRequest_readStatisticalReportsOrders alloc]init];
                    
                    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
                    [request addAccessory:requestAccessory];
                    NSString *token = [JCTokenManager getToken];
                    NSString  *pageNum = [NSString stringWithFormat:@"1"];
                    NSString  *pageSize = [NSString stringWithFormat:@"%d",_allNum];
                    
                    request.requestArgument = @{
                                                @"isAppLogin":@"true",
                                                @"jc4login":token,
                                                @"pageNum":pageNum,
                                                @"pageSize":pageSize,
                                                @"guide":_uID,
                                                @"cycle":_cycleSring,
                                                @"crerteTime":_time,
                                                @"noStop":@"stop"
                                                };
                    
                    
                    [request startWithBlockSuccess:^(__kindof JCRequest_readStatisticalReportsOrders *request) {
                        //
                        NSLog(@"成功获取试用单");
                        NSDictionary *dic =  request.rawJSONObject;
                        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
                        JCModel_probationOrderData *data = base.data;
                        
                        
                        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
                        for (int i = 0; i < data.list.count; i++)
                        {
                            JCModel_probationOrderList * list = data.list[i];
                            if (![list.status  isEqual: @"completed"])
                            {
                                [dataArray1 addObject:list];
                            }
                        }
                        _dataArray = dataArray1;
                        
                        [_tableView reloadData];
                        
                    } failure:^(__kindof JCRequest_readStatisticalReportsOrders *request, NSError *error) {
                        NSLog(@"失败获取试用单 %@",error);
                    }];
                    
                }
                else
                {
                    JCRequest_readStatisticalReportsOrders *request = [[JCRequest_readStatisticalReportsOrders alloc]init];
                    
                    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
                    [request addAccessory:requestAccessory];
                    NSString *token = [JCTokenManager getToken];
                    NSString  *pageNum = [NSString stringWithFormat:@"1"];
                    NSString  *pageSize = [NSString stringWithFormat:@"%d",_allNum];
                    
                    request.requestArgument = @{
                                                @"isAppLogin":@"true",
                                                @"jc4login":token,
                                                @"pageNum":pageNum,
                                                @"pageSize":pageSize,
                                                @"guide":_uID,
                                                @"cycle":_cycleSring,
                                                @"crerteTime":_time,
                                                @"noStop":@"stop"
                                                };
                    
                    
                    [request startWithBlockSuccess:^(__kindof JCRequest_readStatisticalReportsOrders *request) {
                        //
                        NSLog(@"成功获取试用单");
                        NSDictionary *dic =  request.rawJSONObject;
                        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
                        JCModel_probationOrderData *data = base.data;
                        
                        
                        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
                        for (int i = 0; i < data.list.count; i++) {
                            JCModel_probationOrderList * list = data.list[i];
                            if ([list.status  isEqual: @"completed"]) {
                                [dataArray1 addObject:list];
                            }
                        }
                        _dataArray = dataArray1;
                        
                        [_tableView reloadData];
                        
                    } failure:^(__kindof JCRequest_readStatisticalReportsOrders *request, NSError *error) {
                        NSLog(@"失败获取试用单 %@",error);
                    }];
                    
                }
                
            }
            else
            {
                if (buttonNum == 0)
                {
                    JCRequest_getProbations4Group1 *request = [[JCRequest_getProbations4Group1 alloc]init];
                    
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
                                                @"guide":_uID,
                                                @"groupId":_gID
                                                };
                    
                    
                    [request startWithBlockSuccess:^(__kindof JCRequest_getProbations4Group1 *request) {
                        //
                        NSLog(@"成功获取试用单");
                        NSDictionary *dic =  request.rawJSONObject;
                        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
                        JCModel_probationOrderData *data = base.data;
                        
                        
                        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
                        for (int i = 0; i < data.list.count; i++) {
                            JCModel_probationOrderList * list = data.list[i];
                            if (![list.status  isEqual: @"completed"]) {
                                [dataArray1 addObject:list];
                            }
                        }
                        _dataArray = dataArray1;
                        
                        [_tableView reloadData];
                        
                    } failure:^(__kindof JCRequest_getProbations4Group1 *request, NSError *error) {
                        NSLog(@"失败获取试用单 %@",error);
                    }];
                }else {
                    JCRequest_getProbations4Group1 *request = [[JCRequest_getProbations4Group1 alloc]init];
                    
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
                                                @"guide":_uID,
                                                @"groupId":_gID
                                                };
                    
                    
                    [request startWithBlockSuccess:^(__kindof JCRequest_getProbations4Group1 *request) {
                        //
                        NSLog(@"成功获取试用单");
                        NSDictionary *dic =  request.rawJSONObject;
                        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
                        JCModel_probationOrderData *data = base.data;
                        
                        
                        NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
                        for (int i = 0; i < data.list.count; i++) {
                            JCModel_probationOrderList * list = data.list[i];
                            if ([list.status  isEqual: @"completed"]) {
                                [dataArray1 addObject:list];
                            }
                        }
                        _dataArray = dataArray1;
                        
                        [_tableView reloadData];
                        
                    } failure:^(__kindof JCRequest_getProbations4Group1 *request, NSError *error) {
                        NSLog(@"失败获取试用单 %@",error);
                    }];
                }
                
                
            }
            
            
            
        }else {
            
            if (buttonNum == 0)
            {
                JCRequest_readMyProbationOrder *request = [[JCRequest_readMyProbationOrder alloc]init];
                LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
                [request addAccessory:requestAccessory];
                NSString *token = [JCTokenManager getToken];
                NSString  *pageNum = [NSString stringWithFormat:@"1"];
                NSString  *pageSize = [NSString stringWithFormat:@"100"];
                request.requestArgument = @{
                                            @"isAppLogin":@"true",
                                            @"jc4login":token,
                                            @"pageNum":pageNum,
                                            @"pageSize":pageSize
                                            };
                
                
                [request startWithBlockSuccess:^(__kindof JCRequest_readMyProbationOrder *request) {
                    //
                    NSLog(@"成功获取试用单");
                    NSDictionary *dic =  request.rawJSONObject;
                    JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
                    JCModel_probationOrderData *data = base.data;
                    NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
                    for (int i = 0; i < data.list.count; i++)
                    {
                        JCModel_probationOrderList * list = data.list[i];
                        if (![list.status  isEqual: @"completed"])
                        {
                            [dataArray1 addObject:list];
                        }
                    }
                    _dataArray = dataArray1;
                    [_tableView reloadData];
                    
                } failure:^(__kindof JCRequest_readMyProbationOrder *request, NSError *error) {
                    NSLog(@"失败获取试用单 %@",error);
                }];
            }
            else
            {
                JCRequest_readMyProbationOrder *request = [[JCRequest_readMyProbationOrder alloc]init];
                
                LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
                [request addAccessory:requestAccessory];
                NSString *token = [JCTokenManager getToken];
                NSString  *pageNum = [NSString stringWithFormat:@"1"];
                NSString  *pageSize = [NSString stringWithFormat:@"100"];
                
                request.requestArgument = @{
                                            @"isAppLogin":@"true",
                                            @"jc4login":token,
                                            @"pageNum":pageNum,
                                            @"pageSize":pageSize
                                            };
                
                
                [request startWithBlockSuccess:^(__kindof JCRequest_readMyProbationOrder *request) {
                    //
                    NSLog(@"成功获取试用单");
                    NSDictionary *dic =  request.rawJSONObject;
                    JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
                    JCModel_probationOrderData *data = base.data;
                    NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
                    
                    for (int i = 0; i < data.list.count; i++)
                    {
                        JCModel_probationOrderList * list = data.list[i];
                        if ([list.status  isEqual: @"completed"])
                        {
                            [dataArray1 addObject:list];
                        }
                    }
                    _dataArray = dataArray1;
                    
                    [_tableView reloadData];
                    
                } failure:^(__kindof JCRequest_readMyProbationOrder *request, NSError *error) {
                    NSLog(@"失败获取试用单 %@",error);
                }];
            }
        }
    }
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"%@",searchText);
    
    if (_uID.length > 0)
    {
        JCRequest_getProbations4Group1 *request = [[JCRequest_getProbations4Group1 alloc]init];
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
                                    @"guide":_uID,
                                    @"groupId":_gID,
                                    @"searchString":searchText
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequest_getProbations4Group1 *request) {
            //
            NSLog(@"成功获取试用单");
            NSDictionary *dic =  request.rawJSONObject;
            JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
            JCModel_probationOrderData *data = base.data;
            
            
            NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
            for (int i = 0; i < data.list.count; i++)
            {
                JCModel_probationOrderList * list = data.list[i];
                if (![list.status  isEqual: @"completed"])
                {
                    [dataArray1 addObject:list];
                }
            }
            _dataArray = dataArray1;
            
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_getProbations4Group1 *request, NSError *error) {
            NSLog(@"失败获取试用单 %@",error);
        }];
    }
    else
    {
        JCRequest_readMyProbationOrder *request = [[JCRequest_readMyProbationOrder alloc]init];
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
                                    @"searchString":searchText
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequest_readMyProbationOrder *request) {
            //
            NSLog(@"成功获取试用单");
            NSDictionary *dic =  request.rawJSONObject;
            JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
            JCModel_probationOrderData *data = base.data;
            NSMutableArray *dataArray1 = [NSMutableArray arrayWithCapacity:100];
            for (int i = 0; i < data.list.count; i++)
            {
                JCModel_probationOrderList * list = data.list[i];
                if (![list.status  isEqual: @"completed"])
                {
                    [dataArray1 addObject:list];
                }
            }
            _dataArray = dataArray1;
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_readMyProbationOrder *request, NSError *error) {
            NSLog(@"失败获取试用单 %@",error);
        }];
    }
}

//新建成功返回刷新
-(void)newProbationSuccess {
    
    [self readMyData];

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
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
}

//操作详情单回来刷新
-(void)takeProbationSuccess {
    
    [self readMyData];
    
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
