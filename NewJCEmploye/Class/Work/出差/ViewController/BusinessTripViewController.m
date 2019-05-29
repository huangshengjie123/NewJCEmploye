//
//  BusinessTripViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BusinessTripViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCSelectView.h"
#import "ReimbursementTableViewCell.h"
#import "JCRequest_searchMyBusinessTrip.h"
#import "NewBusinesstripViewController.h"
#import "BusinessTripDeatailsViewController.h"
#import "JCRequest_searchCheckBusinessTrip.h"
@interface BusinessTripViewController ()<UITableViewDelegate,UITableViewDataSource,JCSelectViewDelegate,BusinessTripDeatailsActionSuccessDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSString *typeString;
@end

@implementation BusinessTripViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleLabel.text = @"出差";
    self.searchBar.placeholder = @"搜索出差单";
    [self.leftButton addTarget:self action:@selector(leftButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.rightButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self addViews];
    [self readmydata];
}
-(void)leftButtonAction {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)addViews {
    
    JCSelectView *jcselectView = [[JCSelectView alloc]initWithFrame:CGRectMake(0, 150 + 10, JCScreen_Width, 40) withTitleArray:@[@"我的出差",@"待我审批"]];
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
    
    
    JCModel_businessTripList *listData =_dataArray[indexPath.row];
    cell.titleLabel.text = listData.apprInfo.name;
    cell.useNameLabel.text = listData.apprInfo.mbPhone;
    cell.timeLabel.text = [NSString stringWithFormat:@"%@ - %@",listData.start,listData.endProperty];
    cell.itemsLabel.text = [NSString stringWithFormat:@"出差事由:%@",listData.type];
    cell.stastLabel.text = [JCTool chucha:listData.status];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@ - %@",listData.from,listData.to];
    
    
    return cell;
}//13236003020  18012345678

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_businessTripList *listData =_dataArray[indexPath.row];
    BusinessTripDeatailsViewController *vc  = [[BusinessTripDeatailsViewController alloc]init];
    vc.listData = listData;
    vc.typeString = _typeString;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(void)buttonAction:(int)buttonNum {
    
    if (buttonNum == 0)
    {
        _typeString = @"自己";
        [self readmydata];
    }
    if (buttonNum == 1)
    {
        _typeString = @"管理";
        [self readCheckData];
    }
}

-(void)readmydata {
    
    JCRequest_searchMyBusinessTrip *request = [[JCRequest_searchMyBusinessTrip alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_searchMyBusinessTrip *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_businessTripBase *base = [[JCModel_businessTripBase alloc]initWithDictionary:dic];
        JCModel_businessTripData *data = [[JCModel_businessTripData alloc]init];
        data = base.data;
        _dataArray = data.list;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchMyBusinessTrip *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(void)readCheckData {
    
    JCRequest_searchCheckBusinessTrip *request = [[JCRequest_searchCheckBusinessTrip alloc]init];
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
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchCheckBusinessTrip *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_businessTripBase *base = [[JCModel_businessTripBase alloc]initWithDictionary:dic];
        JCModel_businessTripData *data = [[JCModel_businessTripData alloc]init];
        data = base.data;
        _dataArray = data.list;
        
        NSLog(@"%@",dic);
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchCheckBusinessTrip *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}


-(void)rightButtonAction {
    
    NewBusinesstripViewController *vc = [[NewBusinesstripViewController alloc]init];
//    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

-(void)detailsActionSuccessDelegate {
    
   
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    
    NSString *financial = [JCTokenManager sgetFinancial];
    
    if ([_typeString  isEqual: @"自己"])
    {
        JCRequest_searchMyBusinessTrip *request = [[JCRequest_searchMyBusinessTrip alloc]init];
        
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
                                    @"searchString":searchText
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchMyBusinessTrip *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            
            JCModel_businessTripBase *base = [[JCModel_businessTripBase alloc]initWithDictionary:dic];
            JCModel_businessTripData *data = [[JCModel_businessTripData alloc]init];
            data = base.data;
            _dataArray = data.list;
            
            NSLog(@"%@",dic);
            
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_searchMyBusinessTrip *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
        
    }
    else
    {
        JCRequest_searchCheckBusinessTrip *request = [[JCRequest_searchCheckBusinessTrip alloc]init];
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
                                    @"searchString":searchText
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchCheckBusinessTrip *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            
            JCModel_businessTripBase *base = [[JCModel_businessTripBase alloc]initWithDictionary:dic];
            JCModel_businessTripData *data = [[JCModel_businessTripData alloc]init];
            data = base.data;
            _dataArray = data.list;
            
            NSLog(@"%@",dic);
            
            [_tableView reloadData];
            
        } failure:^(__kindof JCRequest_searchCheckBusinessTrip *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    }
    
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
