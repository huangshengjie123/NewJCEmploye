//
//  NewCustomerAddressListViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/18.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewCustomerAddressListViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "NewProbationCustomTableViewCell.h"
#import "AddressViewController.h"
#import "LCNetworkConfig.h"
@interface NewCustomerAddressListViewController ()<UITableViewDelegate,UITableViewDataSource,AddressDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *addressButtonLabel;  //省市区选择
@property (nonatomic,strong) UITextField *addressDetailedTextField;//地址详情
@property (nonatomic,strong) NSString *addressId;

@end

@implementation NewCustomerAddressListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新增客户地址";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-100);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        make.right.equalTo(self.view).offset(-40);
        make.height.equalTo(@(40));
        make.top.equalTo(_tableView.mas_bottom).offset(20);
    }];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4.0f;
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.tag = 0;
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"确定";
    lable.textColor = JCColorWithe;
    lable.font = JCFont14;
    [button addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(button);
        make.centerX.equalTo(button);
    }];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"NewProbationCustomTableViewCell";
    // 1.缓存中取
    NewProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[NewProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    if (indexPath.row == 0) {
        cell.titleLabel.text = @"省市区:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 1;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _addressButtonLabel = cell.buttonLabel;
        
        
    }
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"地址:";
        _addressDetailedTextField = cell.contentTextField;
        
    }
    
    return cell;
}


-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 0) {
        // 确定新增
        
        if (_addressDetailedTextField.text.length == 0) {
            [self showInfo:@"请填写详细地址"];
            return;
        }
        
        if (_addressId == nil) {
            [self showInfo:@"请选择地区"];
            return;
        }
        
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@customer/createCustomerAddress.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        
        JCModel_newCustomerAddressListBase *base = [[JCModel_newCustomerAddressListBase alloc]init];
        
        base.address = _addressDetailedTextField.text;
        base.areaId = _addressId;
        base.type = @"normal";
        base.cusId = _userID;
        
       
        NSDictionary *params = base.dictionaryRepresentation;
        
        
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
                if ([result  isEqual: @"success"] ) {
                    
                    [self.delegate NewMyCustomerSuccuss];
                    [self.navigationController popViewControllerAnimated:YES];
                } else {
                    [self showInfo:msg];
                }
                
                NSLog(@"成功%@",result);
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];

        
    }
    
    if (button.tag == 1) {
        //选择地区
        AddressViewController *addressVC = [[AddressViewController alloc]init];
        addressVC.delegate = self;
        [self.navigationController pushViewController:addressVC animated:YES];
    }
}

-(void)selectedAddress:(NSString *)str and:(NSString *)addressId{
    _addressButtonLabel.text = str;
    _addressId = addressId;
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
