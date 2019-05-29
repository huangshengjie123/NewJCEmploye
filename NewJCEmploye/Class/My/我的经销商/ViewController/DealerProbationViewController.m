//
//  DealerProbationViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/25.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerProbationViewController.h"
#import "Macro.h"
#import "ProbationTableViewCell.h"
#import "DataModels.h"
#import "JCRequest_searchFranProbationsWithPage.h"
#import "NewDealerProbationViewController.h"
#import "SGActionView.h"
#import "Request_readMyWarehouse.h"
#import "ProbationDetailsViewController.h"
@interface DealerProbationViewController ()<UITableViewDelegate,UITableViewDataSource,ProbationDetailsSuccessDelegate,NewFProbationSuccessDelegate>
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *warehouseArray;


@end

@implementation DealerProbationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"经销商试用";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
    
    
    if (_guiID != nil) {
 
    }else{
        
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
//    _searchBar.delegate = self;
    
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

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ProbationTableViewCell";
    // 1.缓存中取
    ProbationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
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
    
    for (int i = 0; i< list.probationCosts.count; i ++) {
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
    JCModel_probationOrderList * list = _dataArray[indexPath.row];
    
    ProbationDetailsViewController *probationDeatilsVC = [[ProbationDetailsViewController alloc]init];
    probationDeatilsVC.probationOrderList = list;
    probationDeatilsVC.delegate = self;
    [self.navigationController pushViewController:probationDeatilsVC animated:YES];
}

-(void)readData {
    JCRequest_searchFranProbationsWithPage *request = [[JCRequest_searchFranProbationsWithPage alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    NSString *str = [JCTokenManager getUserID];
    
    if (_guiID != nil) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"franchiser":_guiID
                                    };
    }else{
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"franchiser":str
                                    };

    }
    
   
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchFranProbationsWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =  request.rawJSONObject;
        JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
        JCModel_probationOrderData *data = base.data;
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchFranProbationsWithPage *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(void)buttonAction {
    
    NSArray *array = @[@"本地",@"仓库"];
    //设置选择框  -1 是为了什么都不选
    [SGActionView showSheetWithTitle:@"选择" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        if (index == 0) {
            NewDealerProbationViewController *newVC = [[NewDealerProbationViewController alloc]init];
            newVC.isNeedOutput = NO;
            newVC.delegate = self;
                  [self.navigationController pushViewController:newVC animated:YES];
        }else {
            [self readMywarehouse];
        }
        
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
        if (_warehouseArray.count >0) {
            JCModel_MyWarehouseData *data = _warehouseArray[0];
            
            NewDealerProbationViewController *newVC = [[NewDealerProbationViewController alloc]init];
            newVC.warehouseId =[NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
            newVC.warehouseString = data.name;
            newVC.isNeedOutput = YES;
            [self.navigationController pushViewController:newVC animated:YES];
        }
        
        
        //在刷新前清空 所有储存的cell
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
}

-(void)takeProbationSuccess {
    [self readData];
}
-(void)newFProbationSuccess {
    [self readData];
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
