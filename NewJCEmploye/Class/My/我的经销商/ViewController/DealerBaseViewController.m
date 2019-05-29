//
//  DealerBaseViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerBaseViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRquest_searchFranchisersWithPage.h"
#import "DealerBaseTableViewCell.h"
#import "DealerDetailsViewController.h"
#import "NewDealerViewController.h"

@interface DealerBaseViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation DealerBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"我的经销商";
    self.view.backgroundColor = JCBackgroundColor;
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    [self addViews];
    [self readData];
}

-(void)buttonAction {
    
    NewDealerViewController *newVC = [[NewDealerViewController alloc]init];
    [self.navigationController pushViewController:newVC animated:YES];
}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索经销商";
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
    
    static NSString *identifier = @"DealerBaseTableViewCell";
    // 1.缓存中取
    DealerBaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[DealerBaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_franchiserList *listData = _dataArray[indexPath.row];

    cell.nameLabel.text =listData.name;
    cell.phoneLabel.text = listData.phone;
    cell.addressLabel.text = [NSString stringWithFormat:@"%@,%@",listData.province,listData.address];
    if ([listData.type  isEqual: @"frak"])
    {
        cell.stastLabel.text = @"特级经销商";
    }
    NSLog(@"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<%@",listData.type);
    if ([listData.type  isEqual: @"fran"])
    {
        cell.stastLabel.text = @"经销商";
    }
    if ([listData.type  isEqual: @"coo"])
    {
        cell.stastLabel.text = @"合作商";
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 78;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_franchiserList *listData = _dataArray[indexPath.row];
    DealerDetailsViewController *vc = [[DealerDetailsViewController alloc]init];
    vc.listData = listData;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)readData {
    
    JCRquest_searchFranchisersWithPage *request = [[JCRquest_searchFranchisersWithPage alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    NSString *uid = [JCTokenManager getUserID];
    
    if (_guideSring != nil) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"guide":_guideSring
                                    };
    }else {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"guide":uid
                                    };
    }
    
    
    
    [request startWithBlockSuccess:^(__kindof JCRquest_searchFranchisersWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_franchiserBase *base = [[JCModel_franchiserBase alloc]initWithDictionary:dic];
        JCModel_franchiserData*data = [[JCModel_franchiserData alloc]init];
        data = base.data;
        _dataArray = data.list;
        [_tableView reloadData];
        NSLog(@"dic%@",dic);;
        
    } failure:^(__kindof JCRquest_searchFranchisersWithPage *request, NSError *error) {
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
