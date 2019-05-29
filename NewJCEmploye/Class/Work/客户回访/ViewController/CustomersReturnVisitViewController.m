//
//  CustomersReturnVisitViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CustomersReturnVisitViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "CustomersReturnVisitTableViewCell.h"
#import "JCRequest_getVisitsBySearchWithPage.h"
#import "NewCustomersVisitViewController.h"
#import "Request_readMyWarehouse.h"
#import "DataModels.h"
#import "SGActionView.h"

@interface CustomersReturnVisitViewController ()<JCSelectViewDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray        *dataArray;
@property (nonatomic,strong) NSMutableArray *warehouseArray;
@end

@implementation CustomersReturnVisitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"客户回访";
    _warehouseArray = [NSMutableArray arrayWithCapacity:10];

    [self addViews];
    [self readData];
}
-(void)addViews {
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10, JCScreen_Width, 40) withTitleArray:@[@"上门回访",@"电话回访"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(jcselectView.mas_bottom).offset(10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(functionalButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CustomersReturnVisitTableViewCell";
    // 1.缓存中取
    CustomersReturnVisitTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[CustomersReturnVisitTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    JCModel_ShowReturnVisitList *listData = _dataArray[indexPath.row];
    
    NSLog(@"listData>>>>>>>>>>>>%@",listData);
    
    cell.nameLabel.text = listData.customer.name;
    [cell.phoneButton setTitle:listData.customer.customerDetail.mobile forState:UIControlStateNormal];
    if (listData.customer.customerAddressList.count > 0 )
    {
        JCModel_ShowReturnVisitCustomerAddressList *addressList = listData.customer.customerAddressList[0];
            cell.addressLabel.text = [NSString stringWithFormat:@"%@%@",addressList.xpath,addressList.address];
    }
    
    cell.contentLabel.text = [NSString stringWithFormat:@"物品:%@",listData.myItem];
    
    if (listData.items.count > 0)
    {
        NSString *itemString = cell.contentLabel.text;
        for (int i = 0; i< listData.items.count; i ++)
        {
            JCModel_ShowReturnVisitItems *cost  = listData.items[i];
            itemString = [NSString stringWithFormat:@"%@ %@x%d",itemString,cost.name,(int)cost.num];
        }
        cell.contentLabel.text = [NSString stringWithFormat:@"%@",itemString];
    }
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 100;
}

-(void)readData {
    
    JCRequest_getVisitsBySearchWithPage *request = [[JCRequest_getVisitsBySearchWithPage alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    NSString *userID = [JCTokenManager getUserID];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"guide":userID,
                                @"vtype":@"0"
                                };
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getVisitsBySearchWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =request.responseJSONObject;
        
        NSDictionary *data = [dic objectForKey:@"data"];
        JCModel_ReturnVisitBase *base = [[JCModel_ReturnVisitBase alloc]initWithDictionary:dic];
    
        _dataArray = base.data.list;
    
        [_tableView reloadData];
        NSLog(@"%@",data);
        
    } failure:^(__kindof JCRequest_getVisitsBySearchWithPage *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}

-(void)functionalButtonAction {
    
   
    [self readMywarehouse:1];
   
}

//先查自己所在仓库
-(void)readMywarehouse:(NSInteger )index2 {
    
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
        
        _warehouseArray = [NSMutableArray arrayWithCapacity:20];
        
        for (int i = 0; i < base.data.count;i++) {
            JCModel_StoreHouseInfoData *data = base.data[i];
            [_warehouseArray addObject:data.name];
        }
        //设置选择框  -1 是为了什么都不选
        [SGActionView showSheetWithTitle:@"选择仓库" itemTitles:_warehouseArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            NewCustomersVisitViewController *vc = [[NewCustomersVisitViewController alloc]init];
             JCModel_StoreHouseInfoData *data = base.data[index];
            vc.warehouseName = data.name;
            vc.warehouseId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
            [self.navigationController pushViewController:vc animated:YES];
        
        }];
        
        //在刷新前清空 所有储存的cell
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
}

//出库入库 切换
-(void)buttonAction:(int)buttonNum {

    
    JCRequest_getVisitsBySearchWithPage *request = [[JCRequest_getVisitsBySearchWithPage alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    NSString *userID = [JCTokenManager getUserID];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"guide":userID,
                                @"vtype":[NSString stringWithFormat:@"%d",buttonNum]
                                };
    NSLog(@"%@",request.requestArgument);
    [request startWithBlockSuccess:^(__kindof JCRequest_getVisitsBySearchWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =request.responseJSONObject;
        
        NSDictionary *data = [dic objectForKey:@"data"];
        JCModel_ReturnVisitBase *base = [[JCModel_ReturnVisitBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data.list;
        
        [_tableView reloadData];
        NSLog(@"%@",data);
        
    } failure:^(__kindof JCRequest_getVisitsBySearchWithPage *request, NSError *error) {
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
