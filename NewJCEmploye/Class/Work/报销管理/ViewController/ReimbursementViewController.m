//
//  ReimbursementViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/15.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReimbursementViewController.h"
#import "JCSelectView.h"
#import "Macro.h"
#import "DataModels.h"
#import "ReimbursementTableViewCell.h"
#import "JCRequest_readmgrReimbursement.h"
#import "JCRequest_readFreimbursementdata.h"
#import "JCRequest_readleaderreimbursement.h"
#import "ReimbursementDeatailsViewController.h"

@interface ReimbursementViewController ()<UITableViewDelegate,UITableViewDataSource,JCSelectViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSString *typestring;

@end

@implementation ReimbursementViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
      [self addViews];
    self.titleLabel.text = @"报销管理";
    self.searchBar.placeholder = @"搜索报销单";
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self readlearderdata];
     _typestring = @"主管审批";
}
-(void)addViews {
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, 150 + 10, JCScreen_Width, 40) withTitleArray:@[@"主管审批",@"财务审批",@"总监审批"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    _tableView = [[UITableView alloc]init];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ReimbursementTableViewCell";
    // 1.缓存中取
    ReimbursementTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_reimbursementList *listData =_dataArray[indexPath.row];
    
    ReimbursementDeatailsViewController *vc = [[ReimbursementDeatailsViewController alloc]init];
    vc.listData = listData;
    vc.typestring = _typestring;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

-(void)leftButtonAction {
    
    [self.navigationController popViewControllerAnimated:YES];

}

-(void)rightButtonAction {
    
}
-(void)readMgrData {
  
        
        JCRequest_readmgrReimbursement *request = [[JCRequest_readmgrReimbursement alloc]init];
        
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
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_readmgrReimbursement *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            
            NSLog(@"%@",dic);
            JCModel_reimbursementBase *base = [[JCModel_reimbursementBase alloc]initWithDictionary:dic];
            
            JCModel_reimbursementData *data = [[JCModel_reimbursementData alloc]init];
            data = base.data;
            
            _dataArray = data.list;
            
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_readmgrReimbursement *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    
}
-(void)readfinancialdata {
    
    JCRequest_readFreimbursementdata *request = [[JCRequest_readFreimbursementdata alloc]init];
    
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
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readFreimbursementdata *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        NSLog(@"%@",dic);
        JCModel_reimbursementBase *base = [[JCModel_reimbursementBase alloc]initWithDictionary:dic];
        
        JCModel_reimbursementData *data = [[JCModel_reimbursementData alloc]init];
        data = base.data;
        
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readFreimbursementdata *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(void)readlearderdata {
    
    
    
    JCRequest_readleaderreimbursement *request = [[JCRequest_readleaderreimbursement alloc]init];
    
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
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readleaderreimbursement *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        NSLog(@"%@",dic);
        JCModel_reimbursementBase *base = [[JCModel_reimbursementBase alloc]initWithDictionary:dic];
        
        JCModel_reimbursementData *data = [[JCModel_reimbursementData alloc]init];
        data = base.data;
        
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readleaderreimbursement *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

- (void)buttonAction:(int)buttonNum {
    
    if (buttonNum== 0) {
        _typestring = @"主管审批";
    }
    if (buttonNum == 1) {
        _typestring = @"财务审批";
    }
    if (buttonNum == 2) {
        _typestring = @"总监审批";
    }
    
    
    if (buttonNum == 0) {
        [self readlearderdata];
    }
    if (buttonNum == 1) {
        [self readfinancialdata];
    }
    if (buttonNum == 2) {
        [self readMgrData];
    }
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
