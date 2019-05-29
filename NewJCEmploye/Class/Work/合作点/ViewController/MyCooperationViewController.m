//
//  MyCooperationViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "MyCooperationViewController.h"
#import "Macro.h"
#import "SellTableViewCell.h"
#import "DataModels.h"
#import "ProbationCustomTableViewCell.h"
#import "NewCooperationViewController.h"
#import "JCRequest_searchCooPoint.h"
#import "CooperationPointDetailsViewController.h"
@interface MyCooperationViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation MyCooperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"合作点";
    self.view.backgroundColor = JCBackgroundColor;
    
    [self addViews];
    [self readData];
    
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(functionalButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
}

-(void)functionalButtonAction {
    
    NewCooperationViewController *vc = [[NewCooperationViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)addViews {
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索合作点";
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
    static NSString *identifier = @"ProbationCustomTableViewCell";
    // 1.缓存中取
    ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_CooperationList *list =  _dataArray[indexPath.row];
    
    cell.nameLabel.text = list.pointName;
    cell.phoneLabel.text = list.pointPhone;
    cell.addressLabel.text = list.pointAddr;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 65;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([_fromString  isEqual: @"newCustomer"])
    {
        JCModel_CooperationList *list =  _dataArray[indexPath.row];
        [self.delegate selectMyCooperationPoiontReturn:list];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        JCModel_CooperationList *list =  _dataArray[indexPath.row];
        CooperationPointDetailsViewController *vc = [[CooperationPointDetailsViewController alloc]init];
        vc.cooperationPointSring = [NSString stringWithFormat:@"%d",(int)list.listIdentifier];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

-(void)readData {
    
    JCRequest_searchCooPoint *request = [[JCRequest_searchCooPoint alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *userID = [JCTokenManager getUserID];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    if (_guideSring !=nil) {
        userID = _guideSring;
    }else {
        userID =[JCTokenManager getUserID];
    }
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"guide":userID
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchCooPoint *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_CooperationBase *base = [[JCModel_CooperationBase alloc]initWithDictionary:dic];
        
        JCModel_CooperationData *data = [[JCModel_CooperationData alloc]init];
        data = base.data;
        
        _dataArray = data.list;
        
        [self.tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchCooPoint *request, NSError *error) {
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
