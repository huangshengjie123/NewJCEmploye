//
//  OtherIncomeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/7.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "OtherIncomeViewController.h"
#import "Macro.h"
#import "OtherIncomeTableViewCell.h"
#import "NewOtherIncomeViewController.h"
#import "InComeDetailsViewController.h"
#import "JCRequest_ReadOtherIncomeData.h"
#import "DataModels.h"
#import "JCRequest_ReadMyOtherIncomeData.h"

@interface OtherIncomeViewController ()<UITableViewDelegate,UITableViewDataSource,NewOtherIncomeSuccessDelegate,DetailsActionSuccessDelegate,UISearchBarDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation OtherIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self createTableview];
    self.titleLabel.text = @"缴款管理";
    self.searchBar.placeholder = @"搜索缴款单";
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
   
    if (_isFinancial == YES)
    {
         [self readData];
          self.rightButton.hidden = YES;
    }
    else
    {
        [self readMyData];
        [self.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
}

-(void)createTableview {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(self.topView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"OtherIncomeTableViewCell";
    OtherIncomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[OtherIncomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    JCModel_OtherIncomeList *listData = _dataArray [indexPath.row];
    
    NSString *financial = [JCTokenManager sgetFinancial];

    if ([financial  isEqual: @"是财务"])
    {
        cell.useNameLabel.text = listData.apprInfo.name;
    }
    
    if ([listData.type  isEqual: Financial_sale_olds]) {
        cell.titleLabel.text = @"卖废品";
    }
    if ([listData.type  isEqual: Financial_donation]) {
        cell.titleLabel.text = @"乐捐";
    }
    
    if ([listData.status  isEqual: Financial_create]) {
        cell.stastLabel.text = @"待确认";
    }
    if ([listData.status  isEqual: Financial_completed]) {
        cell.stastLabel.text = @"完成";
    }
    if ([listData.status  isEqual: Financial_cancel]) {
        cell.stastLabel.text = @"取消";
    }
    cell.priceLabel.text = [NSString stringWithFormat:@"￥ %d",(int)listData.amount];
    cell.timeLabel.text = listData.time;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 95;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_OtherIncomeList *listData = _dataArray [indexPath.row];
    InComeDetailsViewController *vc = [[InComeDetailsViewController alloc]init];
    vc.listData = listData;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}


-(void)leftButtonAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)rightButtonAction {
    
    NewOtherIncomeViewController *vc = [[NewOtherIncomeViewController alloc]init];
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)readData {
    
    JCRequest_ReadOtherIncomeData *request = [[JCRequest_ReadOtherIncomeData alloc]init];
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
                                
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadOtherIncomeData *request) {
  
        NSDictionary *dic = request.responseJSONObject;
        JCModel_OtherIncomeBase *base = [[JCModel_OtherIncomeBase alloc]initWithDictionary:dic];
        JCModel_OtherIncomeData *data = [[JCModel_OtherIncomeData alloc]init];
        data = base.data;
        _dataArray = data.list;
        [_tableView reloadData];
    
    } failure:^(__kindof JCRequest_ReadOtherIncomeData *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}
-(void)readMyData {

    JCRequest_ReadMyOtherIncomeData *request = [[JCRequest_ReadMyOtherIncomeData alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
//    NSString *useiD =[JCTokenManager getUserID];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyOtherIncomeData *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_OtherIncomeBase *base = [[JCModel_OtherIncomeBase alloc]initWithDictionary:dic];
        
        JCModel_OtherIncomeData *data = [[JCModel_OtherIncomeData alloc]init];
        data = base.data;
        _dataArray = data.list;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadMyOtherIncomeData *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

-(void)newOtherIncomeSuccess {
    
    NSString *financial = [JCTokenManager sgetFinancial];

    if ([financial  isEqual: @"是财务"])
    {
        [self readData];
    }
    else
    {
        [self readMyData];
    }
}
/* 返回刷新 */
-(void)detailsActionSuccessDelegate {
    
    NSString *financial = [JCTokenManager sgetFinancial];

    if ([financial  isEqual: @"是财务"])
    {
        [self readData];
    }
    else
    {
        [self readMyData];
    }
}

/* 搜索框 */
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

    NSString *financial = [JCTokenManager sgetFinancial];
    if ([financial  isEqual: @"是财务"])
    {
        JCRequest_ReadOtherIncomeData *request = [[JCRequest_ReadOtherIncomeData alloc]init];
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
                                    @"searchString":searchText
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadOtherIncomeData *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_OtherIncomeBase *base = [[JCModel_OtherIncomeBase alloc]initWithDictionary:dic];
            JCModel_OtherIncomeData *data = [[JCModel_OtherIncomeData alloc]init];
            data = base.data;
            _dataArray = data.list;
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_ReadOtherIncomeData *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
        
    }
    else
    {
        JCRequest_ReadMyOtherIncomeData *request = [[JCRequest_ReadMyOtherIncomeData alloc]init];
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
                                     @"searchString":searchText
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyOtherIncomeData *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_OtherIncomeBase *base = [[JCModel_OtherIncomeBase alloc]initWithDictionary:dic];
            JCModel_OtherIncomeData *data = [[JCModel_OtherIncomeData alloc]init];
            data = base.data;
            _dataArray = data.list;
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_ReadMyOtherIncomeData *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
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
