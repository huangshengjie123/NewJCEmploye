//
//  CooperationsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CooperationsViewController.h"
#import "Macro.h"
#import "CooperationsTableViewCell.h"
#import "CooperationDetailsViewController.h"

@interface CooperationsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;

@end

@implementation CooperationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
}

-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.backgroundColor = JCColorWithe;
    _searchBar.placeholder = @"搜索合作点";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(-10);
        make.right.equalTo(self.view).offset(10);
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
    return 3;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ProbationTableViewCell";
    // 1.缓存中取
    CooperationsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[CooperationsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.nameLabel.text = @"陈升琪";
    cell.phoneLabel.text = @"18922385034";
    cell.timeLabel.text = @"10天";
    cell.addressLabel.text = @"江苏省无锡市滨湖区金石路545号";
    cell.itemsLabel.text = @"酸枝木 x 1 ，酸枝木 x 3 ";
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CooperationDetailsViewController *cooperationDeatilsVC = [[CooperationDetailsViewController alloc]init];
    [self.navigationController pushViewController:cooperationDeatilsVC animated:YES];
}


-(void)buttonAction {
    
  
    
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
