//
//  SearchViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/2/11.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTableViewCell.h"
#import "HCSortString.h"
#import "ZYPinYinSearch.h"
#import <objc/runtime.h>
#import "Macro.h"
#import "DataModels.h"
#import "SearchDetailsViewController.h"

@interface SearchViewController ()<UISearchResultsUpdating,UITableViewDelegate,UITableViewDataSource>

@property (strong, nonatomic) JCModel_employeeInfoData *userData;
@property (strong, nonatomic) UISearchController       *searchController;
@property (strong, nonatomic) NSArray                  *ary;
@property (strong, nonatomic) NSMutableArray           *dataSource;/**<排序前的整个数据源*/
@property (strong, nonatomic) NSDictionary             *allDataSource;/**<排序后的整个数据源*/
@property (strong, nonatomic) NSMutableArray           *searchDataSource;/**<搜索结果数据源*/
@property (strong, nonatomic) NSArray                  *indexDataSource;/**<索引数据源*/
@property (strong, nonatomic) UITableView              *tableView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"通讯录";
    [self getData];

    self.tableView = [[UITableView alloc]init];
    self.tableView.backgroundColor = JCBackgroundColor;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.right.equalTo(self.view);
    }];
    
    [self.tableView setTableHeaderView:self.searchController.searchBar];
}


- (void)getData {
    
    _dataSource = _userDataArray.mutableCopy;
    _allDataSource = [HCSortString sortAndGroupForArray:_dataSource PropertyName:@"name"];
    _indexDataSource = [HCSortString sortForStringAry:[_allDataSource allKeys]];
    _searchDataSource = [NSMutableArray new];
}

- (UISearchController *)searchController {
    
    if (!_searchController)
    {
        _searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
        _searchController.searchResultsUpdater = self;
        _searchController.dimsBackgroundDuringPresentation = NO;
        _searchController.hidesNavigationBarDuringPresentation = YES;
        _searchController.searchBar.placeholder = @"搜索";
        [_searchController.searchBar sizeToFit];
    }
    return _searchController;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    if (!self.searchController.active)
    {
        return _indexDataSource.count;
    }
    else
    {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (!self.searchController.active)
    {
        NSArray *value = [_allDataSource objectForKey:_indexDataSource[section]];
        return value.count;
    }
    else
    {
        return _searchDataSource.count;
    }
}

//头部索引标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    if (!self.searchController.active)
    {
        return _indexDataSource[section];
    }
    else
    {
        return nil;
    }
}

//右侧索引列表
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    
    if (!self.searchController.active)
    {
        return _indexDataSource;
    }
    else
    {
        return nil;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"SearchTableViewCell";
    SearchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[SearchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (!self.searchController.active)
    {
        NSArray *value = [_allDataSource objectForKey:_indexDataSource[indexPath.section]];
        _userData = value[indexPath.row];
    }
    else
    {
        _userData = _searchDataSource[indexPath.row];
    }
    [cell configCellWithModel:_userData];
    return cell;
}
//索引点击事件
- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    
    [tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:index] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    return index;
}

#pragma mark - Table View Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (!self.searchController.active)
    {
        NSArray *value = [_allDataSource objectForKey:_indexDataSource[indexPath.section]];
        _userData = value[indexPath.row];
    }
    else
    {
        _userData = _searchDataSource[indexPath.row];
    }
    SearchDetailsViewController *searchDeatailsVC = [[SearchDetailsViewController alloc]init];
    searchDeatailsVC.infoData = _userData;
    [self.navigationController pushViewController:searchDeatailsVC animated:YES];

}

#pragma mark - UISearchDelegate
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    
    [_searchDataSource removeAllObjects];
    NSArray *ary = [NSArray new];
    //对排序好的数据进行搜索
    ary = [HCSortString getAllValuesFromDict:_allDataSource];
    
    if (searchController.searchBar.text.length == 0)
    {
        [_searchDataSource addObjectsFromArray:ary];
    }
    else
    {
        ary = [ZYPinYinSearch searchWithOriginalArray:ary andSearchText:searchController.searchBar.text andSearchByPropertyName:@"name"];
        [_searchDataSource addObjectsFromArray:ary];
    }
    [self.tableView reloadData];
}

#pragma mark - block

- (void)didSelectedItem:(SelectedItem)block {
    
    self.block = block;
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
