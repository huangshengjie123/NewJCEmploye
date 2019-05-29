//
//  NewDealerViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewDealerViewController.h"
#import "Macro.h"
#import "NewDealerTableViewCell.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "AddressViewController.h"
#import "SGActionView.h"
#import "JCRquest_getOrgTypeZero.h"
@interface NewDealerViewController ()<UITableViewDelegate,UITableViewDataSource,AddressDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *buttonLabel;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UITextField *addressTextField;
@property (nonatomic,strong) UILabel *addressButtonLabel;
@property (nonatomic,strong) NSString *addressId;
@property (nonatomic,strong) UILabel *categoryButtonLabel;
@property (nonatomic,strong) NSString *categoryString;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) NSArray *dataArray2;
@property (nonatomic,strong) UILabel *companyButtonLabel;
@property (nonatomic,strong) NSString *companyString;
@end

@implementation NewDealerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"添加经销商";
    
    if (_listData != nil) {
    
        self.title = @"修改经销商信息";
    }
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
}
-(void)addViews {
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64 +10);
        make.bottom.equalTo(self.view).offset(-70);
    }];
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _button = button;
    
    if(_listData != nil) {
        
        [button addTarget:self action:@selector(xiugaibuttonAction) forControlEvents:UIControlEventTouchUpInside];

    }else {
        
        [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];

    }
    
    
    UILabel*buttonLabel = [[UILabel alloc]init];
    buttonLabel.text = @"确定";
    buttonLabel.textColor = JCColorWithe;
    buttonLabel.font = JCFont15;
    [_button addSubview:buttonLabel];
    [buttonLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
    _buttonLabel  = buttonLabel;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"NewDealerTableViewCell";
    // 1.缓存中取
    NewDealerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[NewDealerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    if (indexPath.row == 0) {
        cell.baseLabel.text = @"姓名";
        cell.textField.placeholder = @"请输入姓名";
        cell.textField.hidden = NO;
        _nameTextField = cell.textField;
        
        if(_listData != nil) {
            
            _nameTextField.text = _listData.name;
            
        }
        
    }
    
    if (indexPath.row == 1) {
        cell.baseLabel.text = @"电话";
        cell.textField.placeholder = @"请输入电话号码";
        cell.textField.hidden = NO;
        _phoneTextField = cell.textField;
        
        if(_listData != nil) {
            
            _phoneTextField.text = _listData.phone;
            
        }
    }
    
    if (indexPath.row == 2) {
        cell.baseLabel.text = @"省市区";
        cell.cellButton.hidden = NO;
        
        cell.cellButton.tag = 0 ;
        [cell.cellButton addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.buttonLabel.hidden = NO;
        _addressButtonLabel = cell.buttonLabel;
        
        if(_listData != nil) {
            
            _addressButtonLabel.text = _listData.xpath;
            _addressId = _listData.areaId;
        }
    }
    
    if (indexPath.row == 3) {
        cell.baseLabel.text = @"地址";
        cell.textField.placeholder = @"请输入地址";
        cell.textField.hidden = NO;
        _addressTextField = cell.textField;
        
        if(_listData != nil) {
            
            _addressTextField.text = _listData.address;
            
        }
    }
    
    if (indexPath.row == 4) {
        cell.baseLabel.text = @"经销商类别";
        cell.cellButton.hidden = NO;
        cell.buttonLabel.hidden = NO;
        cell.cellButton.tag = 1 ;
        [cell.cellButton addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        _categoryButtonLabel = cell.buttonLabel;
        
        
      
        if ([_listData.type  isEqual: @"fran"]) {
            _categoryButtonLabel.text = @"经销商";
              _categoryString = @"fran";
        }
        if ([_listData.type  isEqual: @"coo"]) {
            _categoryButtonLabel.text = @"合作商";
            _categoryString = @"coo";
        }
    }

    return cell;
}

-(void)cellButtonAction:(UIButton *)button {
    
    if (button.tag == 0) {
        AddressViewController *addressVC = [[AddressViewController alloc]init];
        addressVC.delegate = self;
        [self.navigationController pushViewController:addressVC animated:YES];
    }
    
    if (button.tag == 1) {
        NSArray *array = @[@"经销商",@"合作商"];
        
        [SGActionView showSheetWithTitle:@"选择经销商类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _categoryButtonLabel.text = array[index];
            if (index == 0) {
                _categoryString = @"fran";
            }
       
            if (index == 1) {
                _categoryString = @"coo";
            }
        }];
    }
    
//    if (button.tag == 2) {
//
//        [SGActionView showSheetWithTitle:@"选择公司" itemTitles:_dataArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
//
//            _companyButtonLabel.text = _dataArray[index];
//            JCModel_OrgTypeZeroData *data = _dataArray2[index];
//            _companyString = data.orgId;
//
//        }];
//    }
    
   
}
-(void)selectedAddress:(NSString *)str and:(NSString *)addressId  {
    
    _addressButtonLabel.text = str;
    _addressId = addressId;
}

-(void)xiugaibuttonAction {
    
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/updateFranchiser.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    //判断是否为空
    if (_nameTextField.text.length == 0) {
        [self showInfo:@"请填写姓名"];
        return;
    }
    
    if (_phoneTextField.text.length != 11) {
        [self showInfo:@"请填写正确的手机号码"];
        return;
    }
    if (_addressId.length == 0) {
        [self showInfo:@"请选择正确的地区"];
        return;
    }
    if (_addressTextField.text.length == 0) {
        [self showInfo:@"请填写地址"];
        return;
    }
    if (_categoryString.length == 0) {
        [self showInfo:@"请选择经销商类别"];
        return;
    }
    
    
    // 请求参数字典
    JCModel_updateFranchiserDoBase *base = [[JCModel_updateFranchiserDoBase alloc]init];
    base.name = _nameTextField.text;
    base.phone = _phoneTextField.text;
    base.guide = _listData.guide;
    base.areaId = _addressId;
    base.address = _addressTextField.text;
    base.com = _listData.com;
    base.internalBaseClassIdentifier = _listData.listIdentifier.doubleValue;
    
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
                
                
                [self showInfo:@"修改成功，返回刷新查看"];
//                [self.navigationController popViewControllerAnimated:YES];
                
                
            }else {
                [self showInfo:msg];
                
            }
        } else {
            NSLog(@"请求失败error=%@", error);
        }
    }];
    
    [task resume];
    
}

-(void)buttonAction {
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/createFranchiser.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    //判断是否为空
    if (_nameTextField.text.length == 0) {
        [self showInfo:@"请填写姓名"];
        return;
    }
    
    if (_phoneTextField.text.length != 11) {
        [self showInfo:@"请填写正确的手机号码"];
        return;
    }
    if (_addressId.length == 0) {
        [self showInfo:@"请选择正确的地区"];
        return;
    }
    if (_addressTextField.text.length == 0) {
        [self showInfo:@"请填写地址"];
        return;
    }
    if (_categoryString.length == 0) {
        [self showInfo:@"请选择经销商类别"];
        return;
    }

    
    // 请求参数字典
    JCModel_createFranchiserBase *base = [[JCModel_createFranchiserBase alloc]init];
    base.name = _nameTextField.text;
    base.phone = _phoneTextField.text;
    NSString *userString = [JCTokenManager getUserID];
    base.guide = userString.doubleValue;
    base.areaId = _addressId;
    base.address = _addressTextField.text;
    base.com = [JCTokenManager getUserOrgID];
    base.type = _categoryString;
    
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
                
                
                [self.navigationController popViewControllerAnimated:YES];
                
                
            }else {
                [self showInfo:msg];
                
            }
        } else {
            NSLog(@"请求失败error=%@", error);
        }
    }];
    
    [task resume];
}
-(void)readData {
    
    JCRquest_getOrgTypeZero *request = [[JCRquest_getOrgTypeZero alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRquest_getOrgTypeZero *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_OrgTypeZeroBase *base = [[JCModel_OrgTypeZeroBase alloc]initWithDictionary:dic];
        
        NSMutableArray *array =[NSMutableArray arrayWithCapacity:15];
        for (int i = 0; i < base.data.count;i ++) {
            JCModel_OrgTypeZeroData *data = base.data[i];
            [array addObject:data.orgName];
        }
        _dataArray2 = base.data;
        _dataArray = array;
        
    } failure:^(__kindof JCRquest_getOrgTypeZero *request, NSError *error) {
        NSLog(@"失败 %@",error);
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
