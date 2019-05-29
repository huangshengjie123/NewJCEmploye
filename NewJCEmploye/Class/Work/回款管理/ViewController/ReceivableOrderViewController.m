//
//  ReceivableOrderViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReceivableOrderViewController.h"
#import "Macro.h"
#import "SellTableViewCell.h"
#import "JCRequest_ReadReceivableOrder.h"
#import "SellDetailsViewController.h"
@interface ReceivableOrderViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation ReceivableOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = _data.name;
    [self readSellData];
    NSLog(@"%@",_data.dataIdentifier);
    self.view.backgroundColor = JCBackgroundColor;

    [self addViews];

}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索回款单(包含历史回款)";
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
    if (cell == nil) {
        cell = [[SellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    JCModel_ReceivableOrderList *list = _dataArray[indexPath.row];
    
    cell.nameLabel.text = list.customer.name;
    cell.stateLabel.text = [JCTool determinesSellStatusSringWith:list.status];
    cell.phoneLabel.text = list.customer.customerDetail.mobile;
    cell.timeLabel.text = list.createTime;
    
    JCModel_ReceivableOrderCustomerAddressList *address = [[JCModel_ReceivableOrderCustomerAddressList alloc]init];
    
    if (list.customer.customerAddressList.count > 0) {
        address = list.customer.customerAddressList[0];
    }
    
    cell.addressLabel.text = address.xpath;
    
    NSString *itemString = @"";
    
    for (int i = 0; i < list.orderCosts.count; i ++) {
        JCModel_ReceivableOrderOrderCosts *cost = list.orderCosts[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,cost.name,(int)cost.num];
    }
    
    
    for (int i = 0; i < list.orderPresents.count; i ++) {
        JCModel_ReceivableOrderOrderPresents *present = list.orderPresents[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,present.name,(int)present.num];
    }
    
    cell.itemsLabel.text = itemString;

    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_ReceivableOrderList *list = _dataArray[indexPath.row];

    SellDetailsViewController *sellDetailsVC = [[SellDetailsViewController alloc]init];
    sellDetailsVC.receivableOrderList = list;
    [self.navigationController pushViewController:sellDetailsVC animated:YES];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 130;
}


-(void)readSellData {
    
    JCRequest_ReadReceivableOrder *request = [[JCRequest_ReadReceivableOrder alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"groupId":_data.dataIdentifier
                                };
    
    
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadReceivableOrder *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;

        
        JCModel_ReceivableOrderBase *base = [[JCModel_ReceivableOrderBase alloc]initWithDictionary:dic];
        JCModel_ReceivableOrderData *data = [[JCModel_ReceivableOrderData alloc]init];
        data = base.data;
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadReceivableOrder *request, NSError *error) {
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
