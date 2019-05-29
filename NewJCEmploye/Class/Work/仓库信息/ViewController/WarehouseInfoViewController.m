//
//  WarehouseInfoViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WarehouseInfoViewController.h"
#import "Macro.h"
#import "WarehouseInfoTableViewCell.h"
#import "JCRequest_ReadStorehouseInfo.h"
#import "DataModels.h"
#import "WarehouseItemsViewController.h"

@interface WarehouseInfoViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation WarehouseInfoViewController

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"仓库信息";
    [self createUItableview];
    [self readMyData];
}

-(void)createUItableview {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64);
    }];
}
-(void)readMyData {
    
    JCRequest_ReadStorehouseInfo *request = [[JCRequest_ReadStorehouseInfo alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadStorehouseInfo *request) {
        //
        NSLog(@"成功获取仓库信息");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_StoreHouseInfoBase *base = [[JCModel_StoreHouseInfoBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        [_tableView reloadData];
        NSLog(@"dic:::::::::%@",dic);
        
    } failure:^(__kindof JCRequest_ReadStorehouseInfo *request, NSError *error) {
        NSLog(@"失败获取仓库信息 %@",error);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"WarehouseInfoTableViewCell";
    WarehouseInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[WarehouseInfoTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    JCModel_StoreHouseInfoData *data = _dataArray[indexPath.row];
    cell.warehouseName.text = data.name;
    NSArray *array = data.userExtInfoStaffVOList;
    NSString *emplyeesName = @"";

    for (int i = 0; i < array.count; i ++)
    {
        JCModel_StoreHouseInfoUserExtInfoStaffVOList *listData = array[i];
        if (listData.staff == 0)
        {
            cell.adminName.text =[NSString stringWithFormat:@"%@",listData.name];
        }
        else
        {
            if (![emplyeesName  isEqual: @""])
            {
                emplyeesName = [NSString stringWithFormat:@"%@,%@",emplyeesName,listData.name];
            }
            else
            {
                emplyeesName = [NSString stringWithFormat: @"%@",listData.name];
            }
        }
    }
    if ([emplyeesName  isEqual: @""])
    {
        cell.employeesName.text = @"暂无信息";
        cell.employeesName.textColor = JCColorMidGray;
    }
    else
    {
        cell.employeesName.text = emplyeesName;
    }
    return  cell;
}
    
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 88;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_StoreHouseInfoData *data = _dataArray[indexPath.row];
    WarehouseItemsViewController *warehouseItemsVC = [[WarehouseItemsViewController alloc]init];
    warehouseItemsVC.warehouseID = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
    warehouseItemsVC.warehouseName = data.name;
    warehouseItemsVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:warehouseItemsVC animated:YES];
    
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
