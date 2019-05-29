//
//  MyCustomerViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/8.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  我的客户

#import "MyCustomerViewController.h"
#import "Macro.h"
#import "ProbationCustomTableViewCell.h"
#import "JCRequest_ReadMyCustomer.h"
#import "DataModels.h"
#import "NewMyCustomerViewController.h"
#import "MyCustomerDetailsViewController.h"
#import "LCNetworkConfig.h"

@interface MyCustomerViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,NewMyCustomerDelegate,MyCustomerDetailsDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UISearchBar *searchBar;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation MyCustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = JCBackgroundColor;
    [self readMyData];
    [self addViews];
    
}

-(void)addViews {
    
    if (_guideSring != nil)
    {
        
    }
    else
    {
        UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
        [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
        [informationCardBtn sizeToFit];
        UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
        self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    }
    
    _searchBar = [[UISearchBar alloc]init];
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.barTintColor = JCColorWithe;
    _searchBar.placeholder = @"搜索我的客户";
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(-0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.height.equalTo(@(36));
    }];
    _searchBar.delegate = self;
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ProbationCustomTableViewCell";
    ProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[ProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_GetCustmerData *data = _dataArray[indexPath.row];
    NSLog(@"data::::::::::%@",data);
    if (data.introducer)
    {
        cell.nameLabel.text = [NSString stringWithFormat:@"%@(异地客户)",data.name];
    }
    else
    {
        cell.nameLabel.text = data.name;
    }
    
    cell.phoneLabel.text = data.customerDetail.mobile;
    if (data.customerAddressList.count >0)
    {
        JCModel_GetCustmerCustomerAddressList *addressList = data.customerAddressList[0];
//        NSLog(@">>>>>>>>>>>>>>>>>>>>%@",addressList.type);
        cell.addressLabel.text = [NSString stringWithFormat:@"%@%@",addressList.xpath,addressList.address];;
    }
    
    cell.button.tag = (int)indexPath.row;
    [cell.button addTarget:self action:@selector(cellButonAction:) forControlEvents:UIControlEventTouchUpInside];
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 70;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.fromString  isEqual: @"newCustomer"])
    {
        //选择返回 新建客户界面
        JCModel_GetCustmerData *data = _dataArray[indexPath.row];
        [self.delegate selectMyCustomerReturn:data];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        //查看客户详情
        MyCustomerDetailsViewController *myCustomerDetailVC = [[MyCustomerDetailsViewController alloc]init];
        JCModel_GetCustmerData *data = _dataArray[indexPath.row];
        myCustomerDetailVC.data = data;
        myCustomerDetailVC.delegate = self;
       
        [self.navigationController pushViewController:myCustomerDetailVC animated:YES];
    }
}
/* 打电话的 */
-(void)cellButonAction:(UIButton *)button {
    
    JCModel_GetCustmerData *data = _dataArray[button.tag];

    NSString *telephoneNumber= data.customerDetail.mobile;
    NSMutableString * str=[[NSMutableString alloc] initWithFormat:@"tel:%@",telephoneNumber];
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL = [NSURL URLWithString:str];
    [application openURL:URL options:@{} completionHandler:^(BOOL success) {
        //OpenSuccess=选择 呼叫 为 1  选择 取消 为0
        NSLog(@"OpenSuccess=%d",success);
        if (success == 1)
        {
            //呼叫成功，则算做一次
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@visit/createVisit.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_newReturnVisitBase *base = [[JCModel_newReturnVisitBase alloc]init];
            JCModel_newReturnVisitVisit *vist  = [[JCModel_newReturnVisitVisit alloc]init];
            
            vist.vtype = 1;
            vist.guide = [JCTokenManager getUserID].doubleValue;
            vist.cusId = data.dataIdentifier;

            JCModel_newReturnVisitCommand *command = [[JCModel_newReturnVisitCommand alloc]init];
            command.command= @"start";
            command.current = @"output_requst_create";
            JCModel_newReturnVisitInOutOrder *inoutOrder = [[JCModel_newReturnVisitInOutOrder alloc]init];
            inoutOrder.reason = @"Visit";
            inoutOrder.comments  =@"";
            inoutOrder.applicant = [JCTokenManager getUserID].doubleValue;
            inoutOrder.type = 1;

            base.visit = vist;

            NSDictionary *params = base.dictionaryRepresentation;
            
            [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
                
                if ([responseDic[@"code"] integerValue] == 200)
                {
                    [self showInfo:@"电话回访成功"];
                }
                else
                {
                    [self showInfo:responseDic[@"msg"]];
                }
                
            } failure:^(NSError *error) {
                
            }];
        }
        
    }];

}


//新建客户
-(void)buttonAction {
    
    NewMyCustomerViewController *newNC = [[NewMyCustomerViewController alloc]init];
    newNC.delegate = self;
    [self.navigationController pushViewController:newNC animated:YES];
    
}

-(void)NewMyCustomerSuccuss2 {
    
    [self readMyData];
}
-(void)takeSuccussDeetails2
{
    [self readMyData];
}

-(void)readMyData {
    
    JCRequest_ReadMyCustomer *request = [[JCRequest_ReadMyCustomer alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *userId = [JCTokenManager getUserID];
    NSString *token = [JCTokenManager getToken];
    if (_guideSring != nil)
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":_guideSring,
                                    @"pageNum":@"1",
                                    @"pageSize":@"200"
                                    };
    }
    else
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":userId,
                                    @"pageNum":@"1",
                                    @"pageSize":@"200"
                                    };
    }
    
  
//    NSLog(@"requestArgument::::::::::%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyCustomer *request) {
        
        NSLog(@"获取我的客户成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_GetCustmerBase *base = [[JCModel_GetCustmerBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        self.title = [NSString stringWithFormat:@"我的客户(共%d个)",(int)_dataArray.count];
        [_tableView reloadData];
//        NSLog(@"::::::::%@",_dataArray);
        
    } failure:^(__kindof JCRequest_ReadMyCustomer *request, NSError *error) {
        
        NSLog(@"获取我的试用客户成功 %@",error);
        
    }];
    
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {

    JCRequest_ReadMyCustomer *request = [[JCRequest_ReadMyCustomer alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *userId = [JCTokenManager getUserID];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"200"];
    
    if (_guideSring != nil)
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":_guideSring,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"search":searchText
                                    };
    }
    else
    {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":userId,
                                    @"pageNum":pageNum,
                                    @"search":searchText,
                                    @"pageSize":pageSize
                                    };
    }
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyCustomer *request) {
        
        NSLog(@"获取我的客户成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_GetCustmerBase *base = [[JCModel_GetCustmerBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        
        [_tableView reloadData];
        NSLog(@"%@",_dataArray);
        
    } failure:^(__kindof JCRequest_ReadMyCustomer *request, NSError *error) {
        
        NSLog(@"获取我的试用客户成功 %@",error);
        
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
