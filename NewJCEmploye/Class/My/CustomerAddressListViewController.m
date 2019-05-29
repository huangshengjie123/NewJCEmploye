//
//  CustomerAddressListViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/18.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CustomerAddressListViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "CustomerAddressListTableViewCell.h"
#import "JCRequest_getCustomerByCusId.h"
#import "NewCustomerAddressListViewController.h"
#import "JCRequest_deleteCustomerAddresslist.h"
#import "JCRequest_updateCustomerAddressMain.h"
#import "LCNetworkConfig.h"
@interface CustomerAddressListViewController ()<UITableViewDelegate,UITableViewDataSource,NewCustomerAddressListDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;

@end

@implementation CustomerAddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"地址列表";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    
    [self readData];
}

-(void)addViews {
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = JCBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64+10);
        make.bottom.equalTo(self.view);
    }];
    self.tableView.estimatedRowHeight = 44;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(void)buttonAction {
    //新建地址
    NewCustomerAddressListViewController *vc = [[NewCustomerAddressListViewController alloc]init];
    vc.userID = _userID;
    vc.delegate = self;
    [self.navigationController pushViewController:vc animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"CustomerAddressListTableViewCell";
    CustomerAddressListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[CustomerAddressListTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
    JCModel_customerAddressListData *data =_dataArray [indexPath.row];
    
    if([data.type  isEqual: @"main"]) {
        cell.backgroundColor = [UIColor orangeColor];
    }else {
        cell.backgroundColor = [UIColor whiteColor];

    }
    
    cell.contenLabel.text = [NSString stringWithFormat:@"%@%@",data.xpath,data.address];
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if([_type  isEqual: @"我的客户"]) {
        // 设置 默认地址
        JCModel_customerAddressListData *data =_dataArray [indexPath.row];

       
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@customer/updateCustomerAddressMain.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];

        // 请求参数字典

        JCModel_updateAddressMainBase *base = [[JCModel_updateAddressMainBase alloc]init];
        base.type = @"main";
        base.cusId = _userID;
        base.addressId = [NSString stringWithFormat:@"%d",(int)data.addressId];


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

                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                NSLog(@"%@", dic);
                if ([result  isEqual: @"success"] ) {

                     [self showInfo:@"设置默认地址成功"];
                    [self readData];
                } else {
                    [self showInfo:msg];
                }

            } else {
                NSLog(@"请求失败error=%@", error);
                
            }
        }];

        [task resume];
    }else {
        JCModel_customerAddressListData *data =_dataArray [indexPath.row];
        
        [self.delegate selectMyCustomerAddressListReturn:data];
        [self.navigationController popViewControllerAnimated:YES];
    }

}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
    
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        JCModel_customerAddressListData *data =_dataArray [indexPath.row];

        JCRequest_deleteCustomerAddresslist *request = [[JCRequest_deleteCustomerAddresslist alloc]init];
        
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id":[NSString stringWithFormat:@"%d",(int)data.addressId]
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_deleteCustomerAddresslist *request) {
            //
            NSLog(@"成功");
            [self readData];
            
        } failure:^(__kindof JCRequest_deleteCustomerAddresslist *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    }
}



-(void)readData {
    JCRequest_getCustomerByCusId *request = [[JCRequest_getCustomerByCusId alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"cusId":_userID
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getCustomerByCusId *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_customerAddressListBase *base = [[JCModel_customerAddressListBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getCustomerByCusId *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}
-(void)NewMyCustomerSuccuss {
    [self readData];
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
