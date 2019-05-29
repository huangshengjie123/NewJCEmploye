//
//  InterestIncomeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/9.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "InterestIncomeViewController.h"
#import "Macro.h"
#import "InterstIncomeTableViewCell.h"
#import "JCRequest_readInterestIncomeData.h"
#import "NewInterstIncomeViewController.h"
#import "DataModels.h"
@interface InterestIncomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation InterestIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLabel.text = @"利息收入";
    self.searchBar.placeholder = @"查询单据";
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addViews];
    [self readData];
}

-(void)addViews {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.topView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
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
    static NSString *identifier = @"OtherIncomeTableViewCell";
    // 1.缓存中取
    InterstIncomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[InterstIncomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_InterstIncomeList *listData = _dataArray[indexPath.row];
    
    
    
    cell.titleLabel.text = listData.debiter.name;
    cell.stastLabel.text = [JCTool lixi:listData.status];
    
    
    cell.priceLabel.text = [NSString stringWithFormat:@"%.2f(本金) + %.2f(利息)",listData.shouldAmount,listData.shouldInterests];
    cell.timeLabel.text = [NSString stringWithFormat:@"还款时间:%@",listData.endTime];
    
    if ( [listData.type  isEqual: @"pdc"]) {
        cell.typeLabel.text = @"个人";
    }
    
    if ( [listData.type  isEqual: @"cdc"]) {
        cell.typeLabel.text = @"公司";
    }
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 95;
}

-(void)leftButtonAction {
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)rightButtonAction {
    NewInterstIncomeViewController *vc = [[NewInterstIncomeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)readData {
    JCRequest_readInterestIncomeData *request = [[JCRequest_readInterestIncomeData alloc]init];
    
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
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readInterestIncomeData *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_InterstIncomeBase *base= [[JCModel_InterstIncomeBase alloc]initWithDictionary:dic];
        
        JCModel_InterstIncomeData *data = [[JCModel_InterstIncomeData alloc]init];
      
        data = base.data;
        _dataArray = data.list;
        
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readInterestIncomeData *request, NSError *error) {
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
