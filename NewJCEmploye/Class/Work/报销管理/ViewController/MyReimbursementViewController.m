//
//  MyReimbursementViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/15.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "MyReimbursementViewController.h"
#import "Macro.h"
#import "ReimbursementTableViewCell.h"
#import "NewMyReimbursementViewController.h"
#import "JCRequest_readMyreimbursement.h"
#import "DataModels.h"
#import "ReimbursementDeatailsViewController.h"

@interface MyReimbursementViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation MyReimbursementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addViews];
    self.titleLabel.text = @"报销";
    self.searchBar.placeholder = @"搜索我的报销单";
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self readData];
}

-(void)addViews {
    
    _tableView = [[UITableView alloc]init];
    _tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView.mas_bottom).offset(0);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

-(void)leftButtonAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)rightButtonAction {
    
    NewMyReimbursementViewController *vc = [[NewMyReimbursementViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ReimbursementTableViewCell";
    // 1.缓存中取
    ReimbursementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[ReimbursementTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    JCModel_reimbursementList *listData =_dataArray[indexPath.row];
    
    cell.titleLabel.text = listData.apprInfo.name;
    cell.useNameLabel.text = listData.apprInfo.mbPhone;
    cell.timeLabel.text = listData.time;
//    cell.itemsLabel.text = @"报销类别:停车";

//    cell.stastLabel.text = listData.status;
    cell.stastLabel.text = [JCTool baoxiao:listData.status];

    cell.priceLabel.text = [NSString stringWithFormat:@"￥ %d",(int)listData.amount];
    
    return cell;
}
-(void)readData {
    
    JCRequest_readMyreimbursement *request = [[JCRequest_readMyreimbursement alloc]init];
    
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
    [request startWithBlockSuccess:^(__kindof JCRequest_readMyreimbursement *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        NSLog(@"%@",dic);
        JCModel_reimbursementBase *base = [[JCModel_reimbursementBase alloc]initWithDictionary:dic];
        
        JCModel_reimbursementData *data = [[JCModel_reimbursementData alloc]init];
        data = base.data;
        
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readMyreimbursement *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_reimbursementList *listData = _dataArray[indexPath.row];
    ReimbursementDeatailsViewController *vc = [[ReimbursementDeatailsViewController alloc]init];
    vc.listData = listData;
    vc.typestring = @"确认收款";
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
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
