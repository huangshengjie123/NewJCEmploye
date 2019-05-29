//
//  ReWriteSelectedViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/4.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReWriteSelectedViewController.h"
#import "Request_readMyWarehouse.h"
#import "Request_readItemClasesify.h"
#import "Macro.h"
#import "DataModels.h"
#import "RepertoryChooseTableViewCell.h"
@interface ReWriteSelectedViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) NSArray *warehouseArray;
@property (nonatomic,strong) NSArray *classifyArray;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *cellofRepertoryArray;

@end
static NSString *identifier = @"RepertoryChooseTableViewCell";

@implementation ReWriteSelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self readItemClassify];
    [self addViews];
    self.title = @"选择商品";
    self.view.backgroundColor = JCBackgroundColor;
}

-(void)addViews {
    
    self.cellofRepertoryArray = [NSMutableArray arrayWithCapacity:100];

    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"确认"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.placeholder = @"搜索商品";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(36));
    }];
    
    _tableView = [[UITableView alloc]init];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_searchBar.mas_bottom).offset(10);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
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
        
        [_tableView reloadData];
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
}

//读取商品总类
-(void)readItemClassify {
    
    Request_readItemClasesify *request = [[Request_readItemClasesify alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"type":_typeString
                                };
    
    [request startWithBlockSuccess:^(__kindof Request_readItemClasesify *request) {
        //
        NSLog(@"成功获取商品全类目");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_ItemsClassifyBase *base = [[JCModel_ItemsClassifyBase alloc]initWithDictionary:dic];
        _classifyArray = base.data;
        
        [_tableView reloadData];
        
    } failure:^(__kindof Request_readItemClasesify *request, NSError *error) {
        NSLog(@"失败获取商品全类目 %@",error);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _classifyArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   
    // 1.缓存中取
    RepertoryChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[RepertoryChooseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_ItemsClassifyData * data = _classifyArray[indexPath.row];
    cell.titleLabel.text = data.name;
    cell.idDouble = data.dataIdentifier;
    [self.cellofRepertoryArray addObject:cell];

    return  cell;

}

//确认
-(void)buttonAction {
    
    NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:100];
    
    for (int i = 0; i < self.cellofRepertoryArray.count; i ++)
    {
        RepertoryChooseTableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:identifier];
        cell = self.cellofRepertoryArray[i];
        
        if (cell.isSelected == YES)
        {
            JCModel_inOutRewriteItems *jsonCosts = [[JCModel_inOutRewriteItems alloc]init];
            jsonCosts.item = cell.idDouble;
            jsonCosts.num = cell.num;
            jsonCosts.test = cell.titleLabel.text;
            [array2 addObject:jsonCosts];
        }
        
    }
    
    //将身上选择的物品 传值
    [self.delegate selectRepertoryItems:array2 withTypestring:_typeString];
    [self.navigationController popViewControllerAnimated:YES];
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
