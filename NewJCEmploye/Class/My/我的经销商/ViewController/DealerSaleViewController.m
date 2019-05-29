//
//  DealerSaleViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/26.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerSaleViewController.h"
#import "Macro.h"
#import "SellTableViewCell.h"
#import "DataModels.h"
#import "JCRequest_searchFranchiserOrdersWithPage.h"
#import "NewDealerSaleViewController.h"
#import "Request_readMyWarehouse.h"
#import "SGActionView.h"
#import "DealerSaleDetailsViewController.h"
#import "SellDetailsViewController.h"
#import "LCNetworkConfig.h"
@interface DealerSaleViewController ()<UITableViewDelegate,UITableViewDataSource,NewFSaleSuccessDelegate>
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *warehouseArray;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) JCModel_SellOrderList *list;
@property (nonatomic,assign) BOOL isNew;
@end

@implementation DealerSaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"销售";
    self.view.backgroundColor = JCBackgroundColor;
    
    
      if (_guiID != nil) {
          
      }else {
          UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
          [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
          [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
          
          [informationCardBtn sizeToFit];
          UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
          
          self.navigationItem.rightBarButtonItems  = @[informationCardItem];
      }
    
    
 
    [self addViews];
    [self readData];
}

-(void)buttonAction {
    
    NSArray *array = @[@"本地",@"仓库"];
    //设置选择框  -1 是为了什么都不选
    [SGActionView showSheetWithTitle:@"选择" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
        if (index == 0) {
            NewDealerSaleViewController *newVC = [[NewDealerSaleViewController alloc]init];
            newVC.isNeedOutput = NO;
            newVC.delegate = self;
            [self.navigationController pushViewController:newVC animated:YES];
        }else {
            _isNew = YES;
            [self readMywarehouse];
        }
      
    }];
    
    
  
  
    
}


-(void)addViews {
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索销售单(包含历史销售)";
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
    
    static NSString *identifier = @"SellTableViewCell";
    // 1.缓存中取
    SellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[SellTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_SellOrderList *list = _dataArray[indexPath.row];
    
    
    cell.nameLabel.text = list.customer.name;
    
    
    if ([list.type  isEqual: @"cancel"]) {
        cell.stateLabel.text = [NSString stringWithFormat:@"%@(未成交)",[JCTool determinesSellStatusSringWith:list.status]];

    }else {
        cell.stateLabel.text = [JCTool determinesSellStatusSringWith:list.status];
    }
    
    
    cell.phoneLabel.text = list.customer.customerDetail.mobile;
    cell.timeLabel.text = list.createTime;
    
    
    JCModel_SellOrderCustomerAddressList *address = [[JCModel_SellOrderCustomerAddressList alloc]init];
    if (list.customer.customerAddressList.count > 0) {
        address = list.customer.customerAddressList[0];
        
    }
    
    cell.addressLabel.text = address.xpath;
    
    NSString *itemString = @"";
    
    for (int i = 0; i< list.orderCosts.count; i ++) {
        JCModel_probationOrderProbationCosts *cost  = list.orderCosts[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,cost.name,(int)cost.num];
    }
    
    
    
    for (int i = 0; i < list.orderPresents.count; i ++) {
        JCModel_SellOrderOrderPresents *present = list.orderPresents[i];
        itemString = [NSString stringWithFormat:@" %@  %@ x  %d",itemString,present.name,(int)present.num];
    }
    
    cell.itemsLabel.text = itemString;
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 125;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_SellOrderList *list = _dataArray[indexPath.row];

   
 
    if ([list.status  isEqual: @"f_sale_form"]) {
        
        NSArray *array = @[@"本地",@"仓库"];
        //设置选择框  -1 是为了什么都不选
        [SGActionView showSheetWithTitle:@"选择" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            if (index == 0) {
                NewDealerSaleViewController *newVC = [[NewDealerSaleViewController alloc]init];
                newVC.isNeedOutput = NO;
                newVC.sellOrderList = list;
                newVC.isNeedfilling = YES;
                newVC.delegate = self;

                [self.navigationController pushViewController:newVC animated:YES];
            }else {
                _list = list;
                _isNew= NO;
                [self readMywarehouse];
            }
            
        }];
        
    }else {
        SellDetailsViewController *vc = [[SellDetailsViewController alloc]init];
        vc.sellOrderList = list;
        [self.navigationController pushViewController:vc animated:YES];
    }

}

-(void)readData {
    
    JCRequest_searchFranchiserOrdersWithPage *request = [[JCRequest_searchFranchiserOrdersWithPage alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    
    
    if (_guiID != nil) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"noStop":@"stop",
                                    @"franchiserId":_guiID,
                                    };
        
    }else{
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    @"noStop":@"stop",
                                    @"franchiserId":[JCTokenManager getUserID],
                                    };
        
    }
    

    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchFranchiserOrdersWithPage *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
          NSLog(@"%@",dic);
        
        JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
        JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
        data = base.data;
        NSArray *array = data.list;
        NSMutableArray *array1 = [[NSMutableArray alloc]initWithArray:array];
        
        if (array.count >0) {
            for (int i = 0; i <array.count; i++) {
                JCModel_SellOrderList *list = array[i];
                
                
                if ( [[JCTool determinesSellStatusSringWith:list.status] isEqualToString:@"已结束"]) {
                    
                    [array1 removeObject:list];
                    
                }
                
            }
        }
        
        _dataArray = array1;
        
        
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchFranchiserOrdersWithPage *request, NSError *error) {
        NSLog(@"失败 %@",error);
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
            
            NewDealerSaleViewController *newVC = [[NewDealerSaleViewController alloc]init];
            newVC.warehouseId =[NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
            newVC.warehouseString = data.name;
            newVC.delegate = self;

            newVC.isNeedOutput = YES;
            if (_isNew == YES) {
                
            }else {
                newVC.isNeedfilling = YES;
                newVC.sellOrderList = _list;
            }
            
           

            [self.navigationController pushViewController:newVC animated:YES];
        }
        
        
        //在刷新前清空 所有储存的cell
        
    } failure:^(__kindof Request_readMyWarehouse *request, NSError *error) {
        NSLog(@"失败获取自己仓库 %@",error);
    }];
}
-(void)newFSaleSuccess {
    [self readData];
}

// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        JCModel_SellOrderList *list = _dataArray[indexPath.row];
        
        if ([[JCTool determinesSellStatusSringWith:list.status]  isEqual: @"填写完整销售单"]) {
            
            //删除空单
            
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserInOutOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_stopFranchiserSaleBase *base = [[JCModel_stopFranchiserSaleBase alloc]init];
            
            base.command = @"stop";
            
            JCModel_stopFranchiserSaleFranchiserInOutOrder *probation = [[JCModel_stopFranchiserSaleFranchiserInOutOrder alloc]init];;
            
            probation.franchiserInOutOrderIdentifier = list.listIdentifier;
            
            base.franchiserInOutOrder = probation;
            NSDictionary *params = base.dictionaryRepresentation;
            
            NSLog(@"%@",params);
            
            AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
            manager.responseSerializer = [AFHTTPResponseSerializer serializer];
            NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
            request.timeoutInterval = 10.f;
            [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            
            NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                if (!error) {
                    
                    NSArray *responseDictionary = (NSArray *)responseObject;
                    //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                    NSString *result = [dic objectForKey:@"result"];
                    NSString *msg = [dic objectForKey:@"msg"];
                    
                    if ([result isEqualToString:@"success"]) {
                        //删除成功
                        [self showInfo:@"删除成功"];
                        [self readData];
                        
                    }else {
                        [self showInfo:msg];
                    }
                } else {
                    NSLog(@"请求失败error=%@", error);
                }
            }];
            
            [task resume];
            
        }
    }
}

// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
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
