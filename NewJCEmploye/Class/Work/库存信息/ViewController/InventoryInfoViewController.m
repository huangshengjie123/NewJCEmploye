//
//  InventoryInfoViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "InventoryInfoViewController.h"
#import "Macro.h"
#import "CategoryTableViewCell.h"
@interface InventoryInfoViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@end

@implementation InventoryInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}
-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleProminent;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索联系人";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64);
        make.height.equalTo(@(36));
    }];
    
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
    return 4;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"CategoryTableViewCell";
    // 1.缓存中取
    CategoryTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[CategoryTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.categoryTitleLabel.text = @"商品大类";
    return  cell;
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
