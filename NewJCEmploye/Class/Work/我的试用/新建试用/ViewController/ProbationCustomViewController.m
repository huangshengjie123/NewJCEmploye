//
//  ProbationCustomViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ProbationCustomViewController.h"
#import "Macro.h"
#import "ProbationCustomTableViewCell.h"
#import "NewProbationCustomViewController.h"
#import "DataModels.h"
#import "JCRequest_ReadMyProbation.h"
#import "JCRequest_deleteProbationCustomer.h"
#import "MyprobitionDetails1ViewController.h"
#import "JCSelectView.h"
@interface ProbationCustomViewController ()<UITableViewDelegate,UITableViewDataSource,NewProbationCustomDelegate,JCSelectViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSMutableArray *dataArray;
@property (nonatomic,strong) NSMutableArray *dataArray2;
@property (nonatomic,strong) NSMutableArray *dataArray3;
@property (nonatomic,strong) NSMutableArray *dataArray4;
@property (nonatomic,strong) NSMutableArray *dataArray5;
@property (nonatomic,strong) NSMutableArray *dataArray6;
@end

@implementation ProbationCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"试用客户";
    _dataArray = [NSMutableArray arrayWithCapacity:20];
    _dataArray2 = [NSMutableArray arrayWithCapacity:20];
    _dataArray3 = [NSMutableArray arrayWithCapacity:20];
    _dataArray4 = [NSMutableArray arrayWithCapacity:20];
    _dataArray5 = [NSMutableArray arrayWithCapacity:20];
    _dataArray6 = [NSMutableArray arrayWithCapacity:20];

    [self readMyData];
    [self addViews];
    
}

-(void)addViews {
    
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.placeholder = @"搜索试用客户";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(36));
    }];
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, JCNew64 + 10 + 40, JCScreen_Width, 40) withTitleArray:@[@"未试用",@"正在试用",@"未成交"]];
    jcselectView.delegate = self;
    [self.view addSubview:jcselectView];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(jcselectView.mas_bottom).offset (4);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
 
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return  _dataArray.count;
    }
    else if (section == 1)
    {
        return  _dataArray2.count;
    }
    else if (section == 2)
    {
        return  _dataArray3.count;
    }
    else if (section == 3)
    {
        return  _dataArray4.count;
    }
    else if (section == 4)
    {
        return  _dataArray5.count;
    }
    else
    {
        return _dataArray6.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 0) {
        static NSString *identifier = @"ProbationCustomTableViewCell";
        // 1.缓存中取
        ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_ProabtionCustomList *list = _dataArray[indexPath.row];
        
        cell.nameLabel.text = list.name;
        cell.phoneLabel.text = list.phone;
        cell.addressLabel.text = (NSString *)list.address;
        
        return  cell;
  
    }else if (indexPath.section == 1)
    {
        static NSString *identifier = @"ProbationCustomTableViewCell";
        // 1.缓存中取
        ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_ProabtionCustomList *list = _dataArray2[indexPath.row];
        cell.nameLabel.text = list.name;
        cell.phoneLabel.text = list.phone;
        cell.addressLabel.text = (NSString *)list.address;
        return  cell;
    }
    else if (indexPath.section == 2)
    {
        static NSString *identifier = @"ProbationCustomTableViewCell";
        // 1.缓存中取
        ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil)
        {
            cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_ProabtionCustomList *list = _dataArray3[indexPath.row];
        
        cell.nameLabel.text = list.name;
        cell.phoneLabel.text = list.phone;
        cell.addressLabel.text = (NSString *)list.address;
        
        return  cell;
    }
    else if (indexPath.section == 3) {
        static NSString *identifier = @"ProbationCustomTableViewCell";
        // 1.缓存中取
        ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_ProabtionCustomList *list = _dataArray4[indexPath.row];
        
        cell.nameLabel.text = list.name;
        cell.phoneLabel.text = list.phone;
        cell.addressLabel.text = (NSString *)list.address;
        
        return  cell;
    }
    else if (indexPath.section == 4) {
        static NSString *identifier = @"ProbationCustomTableViewCell";
        // 1.缓存中取
        ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_ProabtionCustomList *list = _dataArray5[indexPath.row];
        
        cell.nameLabel.text = list.name;
        cell.phoneLabel.text = list.phone;
        cell.addressLabel.text = (NSString *)list.address;
        
        return  cell;
    }else {
        static NSString *identifier = @"ProbationCustomTableViewCell";
        // 1.缓存中取
        ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        JCModel_ProabtionCustomList *list = _dataArray6[indexPath.row];
        
        cell.nameLabel.text = list.name;
        cell.phoneLabel.text = list.phone;
        cell.addressLabel.text = (NSString *)list.address;
        
        return  cell;
    }
    
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 68;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //等于1 就是选择返回model 如果不是 则是查看详情
    if ([_tpyeString  isEqual: @"1"]) {
        
        if (indexPath.section == 0) {
            JCModel_NewProabtionCustomList *list = _dataArray[indexPath.row];
            [self.delegate selectProbationReturn:list];
            [self.navigationController popViewControllerAnimated:YES];
        }
        if (indexPath.section == 1) {
            JCModel_NewProabtionCustomList *list = _dataArray2[indexPath.row];
            [self.delegate selectProbationReturn:list];
            [self.navigationController popViewControllerAnimated:YES];
        }
        if (indexPath.section == 2) {
            JCModel_NewProabtionCustomList *list = _dataArray3[indexPath.row];
            [self.delegate selectProbationReturn:list];
            [self.navigationController popViewControllerAnimated:YES];
        }
        if (indexPath.section == 3) {
            JCModel_NewProabtionCustomList *list = _dataArray4[indexPath.row];
            [self.delegate selectProbationReturn:list];
            [self.navigationController popViewControllerAnimated:YES];
        }
        if (indexPath.section == 4 ){
            JCModel_NewProabtionCustomList *list = _dataArray5[indexPath.row];
            [self.delegate selectProbationReturn:list];
            [self.navigationController popViewControllerAnimated:YES];
        }
        if (indexPath.section == 5)   {
            JCModel_NewProabtionCustomList *list = _dataArray6[indexPath.row];
            [self.delegate selectProbationReturn:list];
            [self.navigationController popViewControllerAnimated:YES];
        }
        
        
       
    }else {
        
        
        if (indexPath.section == 0) {
            JCModel_NewProabtionCustomList *list = _dataArray[indexPath.row];
            MyprobitionDetails1ViewController *vc = [[MyprobitionDetails1ViewController alloc]init];
            vc.listdata = list;
            [self.navigationController pushViewController:vc animated:YES];
        }else if (indexPath.section == 1) {
            JCModel_NewProabtionCustomList *list = _dataArray2[indexPath.row];
            MyprobitionDetails1ViewController *vc = [[MyprobitionDetails1ViewController alloc]init];
            vc.listdata = list;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.section == 2) {
            JCModel_NewProabtionCustomList *list = _dataArray3[indexPath.row];
            MyprobitionDetails1ViewController *vc = [[MyprobitionDetails1ViewController alloc]init];
            vc.listdata = list;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.section == 3) {
            JCModel_NewProabtionCustomList *list = _dataArray4[indexPath.row];
            MyprobitionDetails1ViewController *vc = [[MyprobitionDetails1ViewController alloc]init];
            vc.listdata = list;
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (indexPath.section == 4) {
            JCModel_NewProabtionCustomList *list = _dataArray5[indexPath.row];
            MyprobitionDetails1ViewController *vc = [[MyprobitionDetails1ViewController alloc]init];
            vc.listdata = list;
            [self.navigationController pushViewController:vc animated:YES];
        }else {
            JCModel_NewProabtionCustomList *list = _dataArray6[indexPath.row];
            MyprobitionDetails1ViewController *vc = [[MyprobitionDetails1ViewController alloc]init];
            vc.listdata = list;
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    
    }
    
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    
    
    UIView* view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1)];
    view.backgroundColor = JCBackgroundColor;
    
    UILabel *label = [[UILabel alloc]init];
    label.font = [UIFont boldSystemFontOfSize:16];
    label.textColor = [UIColor darkGrayColor];
    [view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view).offset(10);
        make.centerY.equalTo(view);
    }];
    //        _formArray = @[ @"客户回馈活动", @"外部活动", @"合作点介绍",@"陌生拜访",@"转介绍",@"其他方式"];

    if (_dataArray.count > 0) {
        if (section == 0) {
            label.text = @"客户回馈活动";
        }
    }
   
    
    if (_dataArray2.count >0) {
        if (section == 1) {
            
            label.text = @"外部活动";
        }
    }
    
    if (_dataArray3.count >0) {
        if (section == 2) {
            
            label.text = @"合作点介绍";
        }
    }
    
    if (_dataArray4.count >0) {
        if (section == 3) {
            
            label.text = @"陌生拜访";
        }
    }
    
    if (_dataArray5.count >0) {
        if (section == 4) {
            
            label.text = @"转介绍";
        }
    }
    
    if (_dataArray6.count >0) {
        if (section == 5) {
            
            label.text = @"其他方式";
        }
    }
    
    return view ;
    
}

-(void)buttonAction {
    
    NewProbationCustomViewController *newProbationCustonVC = [[NewProbationCustomViewController alloc]init];
    newProbationCustonVC.delegate = self;
    [self.navigationController pushViewController:newProbationCustonVC animated:YES];
    
}

-(void)newSuccessed {
    
    [self readMyData];
}

//读取我的试用客户信息
-(void)readMyData {
    
    JCRequest_ReadMyProbation *request = [[JCRequest_ReadMyProbation alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *userId = [JCTokenManager getUserID];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];

    
    if (_guideSring != nil) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":_guideSring,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize
                                    };
    }else{
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":userId,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize
                                    };
    }
    
 
     NSLog(@"%@",request.requestArgument);

    [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyProbation *request) {

        NSLog(@"获取我的试用客户成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_NewProabtionCustomBase *base = [[JCModel_NewProabtionCustomBase alloc]initWithDictionary:dic];
        
        JCModel_NewProabtionCustomData *data = base.data;
        
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];

        for (int i = 0; i < data.list.count; i++) {
            JCModel_NewProabtionCustomList *list = data.list[i];
            NSLog(@"%f",list.isRegister);
            if ((int)list.isRegister == 0) {
                [array addObject:list];
            }
        }
        
        for (int i = 0; i < array.count; i++) {
            JCModel_NewProabtionCustomList *list = array[i];
           
            if ((int)list.from == 0 ) {
                [_dataArray addObject:list];
            }
            if ((int)list.from == 1 ) {
                [_dataArray2 addObject:list];

            }
            if ((int)list.from == 2 ) {
                [_dataArray3 addObject:list];

            }
            if ((int)list.from == 3 ) {
                [_dataArray4 addObject:list];

            }
            if ((int)list.from == 4 ) {
                [_dataArray5 addObject:list];

            }
            if ((int)list.from == 5 ) {
                [_dataArray6 addObject:list];

            }
        }

        
        [_tableView reloadData];

    } failure:^(__kindof JCRequest_ReadMyProbation *request, NSError *error) {

        NSLog(@"获取我的试用客户成功 %@",error);

    }];
}

//- ( UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)){
//    //删除
//    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
//
//
//        sourceView.backgroundColor = GrayColor;
//
////        [self.titleArr removeObjectAtIndex:indexPath.row];
//
//        JCRequest_deleteProbationCustomer *request = [[JCRequest_deleteProbationCustomer alloc]init];
//
//        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
//        [request addAccessory:requestAccessory];
//        NSString *token = [JCTokenManager getToken];
//        JCModel_ProabtionCustomList *list = _dataArray[indexPath.row];
//        NSString *listId = [NSString stringWithFormat:@"%d",(int)list.listIdentifier];
//
//        request.requestArgument = @{
//                                    @"isAppLogin":@"true",
//                                    @"jc4login":token,
//                                    @"id":listId,
//                                    };
//
//
//        [request startWithBlockSuccess:^(__kindof JCRequest_deleteProbationCustomer *request) {
//            //
//            NSLog(@"成功");
//            completionHandler (YES);
//            [self.tableView reloadData];
//
//        } failure:^(__kindof JCRequest_deleteProbationCustomer *request, NSError *error) {
//            NSLog(@"失败 %@",error);
//        }];
//
//
//
//    }];
//    deleteRowAction.image = [UIImage imageNamed:@"删除"];
//    deleteRowAction.backgroundColor = [UIColor redColor];
//
//    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction]];
//    return config;
//}

-(void)buttonAction:(int)buttonNum {
    
    [_dataArray removeAllObjects];
    [_dataArray2 removeAllObjects];
    [_dataArray3 removeAllObjects];
    [_dataArray4 removeAllObjects];
    [_dataArray5 removeAllObjects];
    [_dataArray6 removeAllObjects];

    if (buttonNum == 0) {
        JCRequest_ReadMyProbation *request = [[JCRequest_ReadMyProbation alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *userId = [JCTokenManager getUserID];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        
        
        if (_guideSring != nil) {
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"guide":_guideSring,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize
                                        };
        }else{
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"guide":userId,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize
                                        };
        }
        
        NSLog(@"%@",request.requestArgument);
        
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyProbation *request) {
            
            NSLog(@"获取我的试用客户成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_NewProabtionCustomBase *base = [[JCModel_NewProabtionCustomBase alloc]initWithDictionary:dic];
            
            JCModel_NewProabtionCustomData *data = base.data;
            
            
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
            

            for (int i = 0; i < data.list.count; i++) {
                JCModel_NewProabtionCustomList *list = data.list[i];
                NSLog(@"%f",list.isRegister);
                if ((int)list.isRegister == 0) {
                    [array addObject:list];
                }
            }
            
            for (int i = 0; i < array.count; i++) {
                JCModel_NewProabtionCustomList *list = array[i];
                
                if ((int)list.from == 0 ) {
                    [_dataArray addObject:list];
                }
                if ((int)list.from == 1 ) {
                    [_dataArray2 addObject:list];
                    
                }
                if ((int)list.from == 2 ) {
                    [_dataArray3 addObject:list];
                    
                }
                if ((int)list.from == 3 ) {
                    [_dataArray4 addObject:list];
                    
                }
                if ((int)list.from == 4 ) {
                    [_dataArray5 addObject:list];
                    
                }
                if ((int)list.from == 5 ) {
                    [_dataArray6 addObject:list];
                }
            }
            
            
            [_tableView reloadData];
            NSLog(@"%@",_dataArray);
            
        } failure:^(__kindof JCRequest_ReadMyProbation *request, NSError *error) {
            
            NSLog(@"获取我的试用客户成功 %@",error);
            
        }];
    }else if (buttonNum == 1) {
        
        JCRequest_ReadMyProbation *request = [[JCRequest_ReadMyProbation alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *userId = [JCTokenManager getUserID];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        
        
        if (_guideSring != nil) {
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"guide":_guideSring,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize
                                        };
        }else{
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"guide":userId,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize
                                        };
        }
        
        NSLog(@"%@",request.requestArgument);
        
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyProbation *request) {
            
            NSLog(@"获取我的试用客户成功");
            NSDictionary *dic = request.responseJSONObject;
            JCModel_NewProabtionCustomBase *base = [[JCModel_NewProabtionCustomBase alloc]initWithDictionary:dic];

         
            
            JCModel_NewProabtionCustomData *data = base.data;
            
            
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
            
            
            
            
            for (int i = 0; i < data.list.count; i++) {
                JCModel_NewProabtionCustomList *list = data.list[i];
                NSLog(@"%f",list.isRegister);
                if ((int)list.isRegister == 2) {
                    [array addObject:list];
                }
            }
            
            for (int i = 0; i < array.count; i++) {
                JCModel_NewProabtionCustomList *list = array[i];
                
                if ((int)list.from == 0 ) {
                    [_dataArray addObject:list];
                }
                if ((int)list.from == 1 ) {
                    [_dataArray2 addObject:list];
                    
                }
                if ((int)list.from == 2 ) {
                    [_dataArray3 addObject:list];
                    
                }
                if ((int)list.from == 3 ) {
                    [_dataArray4 addObject:list];
                    
                }
                if ((int)list.from == 4 ) {
                    [_dataArray5 addObject:list];
                    
                }
                if ((int)list.from == 5 ) {
                    [_dataArray6 addObject:list];
                }
            }
            
            
            [_tableView reloadData];
     
            
        } failure:^(__kindof JCRequest_ReadMyProbation *request, NSError *error) {
            
            NSLog(@"获取我的试用客户成功 %@",error);
            
        }];
        
    }else {
        
        JCRequest_ReadMyProbation *request = [[JCRequest_ReadMyProbation alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *userId = [JCTokenManager getUserID];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        
        
        if (_guideSring != nil) {
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"guide":_guideSring,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize
                                        };
        }else{
            request.requestArgument = @{
                                        @"isAppLogin":@"true",
                                        @"jc4login":token,
                                        @"guide":userId,
                                        @"pageNum":pageNum,
                                        @"pageSize":pageSize
                                        };
        }
        
        NSLog(@"%@",request.requestArgument);
        
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyProbation *request) {
            
            NSLog(@"获取我的试用客户成功");
            NSDictionary *dic = request.responseJSONObject;
            
            NSLog(@"dic%@",dic);

            JCModel_NewProabtionCustomBase *base = [[JCModel_NewProabtionCustomBase alloc]initWithDictionary:dic];
            
            JCModel_NewProabtionCustomData *data = base.data;
            
            
            NSMutableArray *array = [NSMutableArray arrayWithCapacity:100];
            
            
            
            
            for (int i = 0; i < data.list.count; i++) {
                JCModel_NewProabtionCustomList *list = data.list[i];
                NSLog(@"%f",list.isRegister);
                if ((int)list.isRegister == 3) {
                    [array addObject:list];
                }
            }
            for (int i = 0; i < array.count; i++) {
                JCModel_NewProabtionCustomList *list = array[i];
                
                if ((int)list.from == 0 ) {
                    [_dataArray addObject:list];
                }
                if ((int)list.from == 1 ) {
                    [_dataArray2 addObject:list];
                    
                }
                if ((int)list.from == 2 ) {
                    [_dataArray3 addObject:list];
                    
                }
                if ((int)list.from == 3 ) {
                    [_dataArray4 addObject:list];
                    
                }
                if ((int)list.from == 4 ) {
                    [_dataArray5 addObject:list];
                    
                }
                if ((int)list.from == 5 ) {
                    [_dataArray6 addObject:list];
                    
                }
            }
            
            
            [_tableView reloadData];
      
            
        } failure:^(__kindof JCRequest_ReadMyProbation *request, NSError *error) {
            
            NSLog(@"获取我的试用客户成功 %@",error);
            
        }];
    }
    
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
