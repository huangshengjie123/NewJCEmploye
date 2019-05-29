//
//  SellViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/14.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.

#import "SellViewController.h"
#import "Macro.h"
#import "SellTableViewCell.h"
#import "NewSellViewController.h"
#import "SellDetailsViewController.h"
#import "LCNetworkConfig.h"
#import "JCRequest_ReadAllSell.h"
#import "SGActionView.h"
#import "Request_readMyWarehouse.h"
#import "DataModels.h"
#import "JCRequest_ReadSaleOrderGroupM.h"

@interface SellViewController ()<UITableViewDelegate,UITableViewDataSource,NewSellSuccessDelegate,UISearchBarDelegate,SellDetailsSuccessDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *warehouseArray;
@property (nonatomic,strong) NSArray     *dataArray;


@end

@implementation SellViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"销售";
    [self addViews];
    if (_uID.length > 0)
    {
        if ([_sring  isEqual: @"工作组统计"])
        {
            if (_isAll == YES)
            {
                [self readData333];
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
        if (_searchString != nil)
        {
            [self readSearchData];
        }
        else
        {
            [self readSellData];
        }
    }
    [self readMywarehouse];
    self.view.backgroundColor = JCBackgroundColor;
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
}

-(void)addButtonAction {
    
    NewSellViewController *newSellVC = [[NewSellViewController alloc]init];
    newSellVC.delegate = self;
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:20];
    for (int i = 0; i<_warehouseArray.count; i++)
    {
        JCModel_MyWarehouseData *data = _warehouseArray[i];
        [array addObject:data.name];
    }
    
    [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        
        newSellVC.warehouseString = array[index];
        JCModel_MyWarehouseData *data =   _warehouseArray[index];
        newSellVC.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
        [self.navigationController pushViewController:newSellVC animated:YES];
        
    }];
    
}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    if (_searchString != nil)
    {
        _searchBar.text = _searchString;
    }
    _searchBar.placeholder = @"搜索销售单(包含历史销售)";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(-0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.mas_equalTo(36);
    }];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"SellTableViewCell";
    SellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[SellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    JCModel_SellOrderList *list = _dataArray[indexPath.row];
    cell.nameLabel.text = list.customer.name;
    cell.stateLabel.text = [JCTool determinesSellStatusSringWith:list.status];
    cell.phoneLabel.text = list.customer.customerDetail.mobile;
    cell.timeLabel.text = list.createTime;
    JCModel_SellOrderCustomerAddressList *address = [[JCModel_SellOrderCustomerAddressList alloc]init];
    if (list.customer.customerAddressList.count > 0)
    {
        address = list.customer.customerAddressList[0];
    }
    cell.addressLabel.text = address.xpath;
    NSString *itemString = @"";
    
    for (int i = 0; i< list.orderCosts.count; i ++)
    {
        JCModel_probationOrderProbationCosts *cost  = list.orderCosts[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,cost.name,(int)cost.num];
    }

    for (int i = 0; i < list.orderPresents.count; i ++)
    {
        JCModel_SellOrderOrderPresents *present = list.orderPresents[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,present.name,(int)present.num];
    }
    
    cell.itemsLabel.text = itemString;
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 125;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_uID.length > 0)
    {
        JCModel_SellOrderList *list = _dataArray[indexPath.row];
        SellDetailsViewController *sellDetailsVC = [[SellDetailsViewController alloc]init];
        sellDetailsVC.sellOrderList = list;
        sellDetailsVC.isReadOfLeader = YES;
        [self.navigationController pushViewController:sellDetailsVC animated:YES];
    }
    else
    {
        JCModel_SellOrderList *list = _dataArray[indexPath.row];
        SellDetailsViewController *sellDetailsVC = [[SellDetailsViewController alloc]init];
        sellDetailsVC.sellOrderList = list;
        sellDetailsVC.delegate = self;
        [self.navigationController pushViewController:sellDetailsVC animated:YES];
    }

}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_SellOrderList *list = _dataArray[indexPath.row];
    if (list.customer.name  == nil && [[JCTool determinesSellStatusSringWith:list.status]  isEqual: @"待补填订单"])
    {
        return YES;
    }
    return NO;
    
}

// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        JCModel_SellOrderList *list = _dataArray[indexPath.row];
        if (list.customer.name  == nil && [[JCTool determinesSellStatusSringWith:list.status]  isEqual: @"待补填订单"])
        {
            //删除空单
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealSaleOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_SellLeaderCheckBase *base = [[JCModel_SellLeaderCheckBase alloc]init];
            
            base.command = @"stop";
            base.current = sellStatus_create_order ;
       
            JCModel_SellLeaderCheckOrder *probation = [[JCModel_SellLeaderCheckOrder alloc]init];;
            
            probation.orderIdentifier = list.listIdentifier;
            
            base.order = probation;
            NSDictionary *params = base.dictionaryRepresentation;
            
            [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
                
                if ([responseDic[@"code"] integerValue] == 200)
                {
                    [self showInfo:@"删除成功"];
                    [self readSellData];
                }
                else
                {
                    [self showInfo:responseDic[@"msg"]];
                }
                
            } failure:^(NSError *error) {
                
            }];
            
        }
    }
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return @"删除";
}

//查看组内
-(void)readData22 {
    
    JCRequest_getSaleOrders4Group2 *request = [[JCRequest_getSaleOrders4Group2 alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"guide":_uID,
                                @"groupId":_gID
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_getSaleOrders4Group2 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
        
        if (array.count >0)
        {
            for (int i = 0; i <array.count; i++)
            {
                JCModel_SellOrderList *list = array[i];
                
                if ( [[JCTool determinesSellStatusSringWith:list.status] isEqualToString:@"已结束"])
                {
                    [array1 removeObject:list];
                }
            }
        }
        
        _dataArray = array1;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getSaleOrders4Group2 *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(void)readData333 {
    
    JCRequest_getSaleOrders4Group2 *request = [[JCRequest_getSaleOrders4Group2 alloc]init];
    
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
                                @"createTime":_time,
                                @"noStop":@"stop",
                                };
    
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadSaleOrderGroupM *request) {
        //
        NSDictionary *dic = request.responseJSONObject;
        
        
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
        
        if (array.count >0)
        {
            for (int i = 0; i <array.count; i++)
            {
                JCModel_SellOrderList *list = array[i];
            }
        }
        
        _dataArray = array;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadSaleOrderGroupM *request, NSError *error) {
        NSLog(@"失败获取试用单 %@",error);
    }];
}

-(void)readData3 {
    
    JCRequest_ReadSaleOrderGroupM *request = [[JCRequest_ReadSaleOrderGroupM alloc]init];
    
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
                                @"createTime":_time,
                                @"noStop":@"stop",
                                };
    
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadSaleOrderGroupM *request) {
        //
      NSDictionary *dic = request.responseJSONObject;
        
        
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
       
        if (array.count >0)
        {
            for (int i = 0; i <array.count; i++)
            {
                JCModel_SellOrderList *list = array[i];
            }
        }
        
        _dataArray = array;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadSaleOrderGroupM *request, NSError *error) {
        NSLog(@"失败获取试用单 %@",error);
    }];
}

//读取销售订单
-(void)readSellData {
    
    JCRequest_ReadAllSell *request = [[JCRequest_ReadAllSell alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllSell *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];

        if (array.count >0) {
            for (int i = 0; i <array.count; i++) {
                JCModel_SellOrderList *list = array[i];
                

                if ( [[JCTool determinesSellStatusSringWith:list.status] isEqualToString:@"已结束"]) {
                    
                    [array1 removeObject:list];
                    
                }
                
            }
        }
        
        _dataArray = array1;
        

        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadAllSell *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
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

-(void)readSearchData {
    JCRequest_ReadAllSell *request = [[JCRequest_ReadAllSell alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"searchString":_searchString
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllSell *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
        
        if (array.count >0) {
            for (int i = 0; i <array.count; i++) {
                JCModel_SellOrderList *list = array[i];
                
                
                if ( [[JCTool determinesSellStatusSringWith:list.status] isEqualToString:@"已结束"]) {
                    
                    [array1 removeObject:list];
                    
                }
                
            }
        }
        
        _dataArray = array1;
        
        
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadAllSell *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}


//刷新
-(void)takeSellSuccess {
    
    [self readSellData];
    
}
-(void)newSellSuccess111 {
    
    
    [self readSellData];

}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    
    JCRequest_ReadAllSell *request = [[JCRequest_ReadAllSell alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"searchString":searchText
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllSell *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
        
        if (array.count >0) {
            for (int i = 0; i <array.count; i++) {
                JCModel_SellOrderList *list = array[i];
                
                
                if ( [[JCTool determinesSellStatusSringWith:list.status] isEqualToString:@"已结束"]) {
                    
                    [array1 removeObject:list];
                    
                }
                
            }
        }
        
        _dataArray = array1;
        
        
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadAllSell *request, NSError *error) {
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
