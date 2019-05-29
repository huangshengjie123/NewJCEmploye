//
//  NewCooperationViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/11/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewCooperationViewController.h"
#import "Macro.h"
#import "NewDealerTableViewCell.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "AddressViewController.h"
#import "SGActionView.h"
@interface NewCooperationViewController ()<UITableViewDelegate,UITableViewDataSource,AddressDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIButton *button;
@property (nonatomic,strong) UILabel *buttonLabel;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UITextField *addressTextField;
@property (nonatomic,strong) UILabel *addressButtonLabel;
@property (nonatomic,strong) NSString *addressId;
@property (nonatomic,strong) UITextField *legalNameTextField;
@property (nonatomic,strong) UITextField *legalPhoneTextField;
@property (nonatomic,strong) UITextField *remakeTextField;


@end

@implementation NewCooperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (_listData != nil) {
        self.title = @"修改合作点";
    }else {
        self.title = @"新增合作点";
    }
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
    
}
-(void)readData {
    
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
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
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

-(void)buttonAction {
    if (_nameTextField.text.length== 0) {
        [self showInfo:@"请填写合作点店名"];
        return;
    }
    
    if (_phoneTextField.text.length != 11) {
        [self showInfo:@"请填写正确的手机号码"];
        return;
    }
    
    if (_addressTextField.text.length == 0) {
        [self showInfo:@"请填写地址"];
        return;
    }
    
    if (_addressId == nil) {
        [self showInfo:@"请选择地区"];
        return;
    }
    
    if (_legalNameTextField.text.length == 0) {
        [self showInfo:@"请填写法人姓名"];
        return;
    }
    
    if (_legalPhoneTextField.text.length != 11) {
        [self showInfo:@"请填写正确法人手机号码"];
        return;
    }


    
    if (_listData != nil) {
        //修改
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@cooPoint/updateCooPoint.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        
        
        // 请求参数字典
        JCModel_NewCooperationBase *base = [[JCModel_NewCooperationBase alloc]init];
        base.pointName = _nameTextField.text;
        base.pointPhone = _phoneTextField.text;
        NSString *userString = [JCTokenManager getUserID];
        base.guide = userString.doubleValue;
        base.areaId = _addressId;
        base.pointAddr = _addressTextField.text;
        base.law = _legalNameTextField.text;
        base.lawPhone = _legalPhoneTextField.text;
        
        
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
        
        
    }else {
        //新建

        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@cooPoint/createCooPoint.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        
        
        // 请求参数字典
        JCModel_NewCooperationBase *base = [[JCModel_NewCooperationBase alloc]init];
        base.pointName = _nameTextField.text;
        base.pointPhone = _phoneTextField.text;
        NSString *userString = [JCTokenManager getUserID];
        base.guide = userString.doubleValue;
        base.areaId = _addressId;
        base.pointAddr = _addressTextField.text;
        base.law = _legalNameTextField.text;
        base.lawPhone = _legalPhoneTextField.text;
        
        
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
    
    
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
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
        cell.baseLabel.text = @"合作点店名";
        cell.textField.placeholder = @"请输入合作点店名";
        cell.textField.hidden = NO;
        _nameTextField = cell.textField;
    }
    
    if (indexPath.row == 1) {
        cell.baseLabel.text = @"电话";
        cell.textField.placeholder = @"请输入合作点电话号码";
        cell.textField.hidden = NO;
        _phoneTextField = cell.textField;
    }
    
    if (indexPath.row == 2) {
        cell.baseLabel.text = @"省市区";
        cell.cellButton.hidden = NO;
        cell.cellButton.tag = 0 ;
        [cell.cellButton addTarget:self action:@selector(cellButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        cell.buttonLabel.hidden = NO;
        _addressButtonLabel = cell.buttonLabel;
    }
    
    if (indexPath.row == 3) {
        cell.baseLabel.text = @"地址";
        cell.textField.placeholder = @"请输入地址";
        cell.textField.hidden = NO;
        _addressTextField = cell.textField;
    }
    
    if (indexPath.row == 4) {
        cell.baseLabel.text = @"法人姓名";
        cell.textField.placeholder = @"法人姓名";
        cell.textField.hidden = NO;
        _legalNameTextField = cell.textField;
    }
    
    if (indexPath.row == 5) {
        cell.baseLabel.text = @"法人电话";
        cell.textField.placeholder = @"法人电话";
        cell.textField.hidden = NO;
        _legalPhoneTextField = cell.textField;
    }
    if (indexPath.row == 6) {
        cell.baseLabel.text = @"备注";
        cell.textField.placeholder = @"请填写备注";
        cell.textField.hidden = NO;
        _remakeTextField = cell.textField;
    }
    
    if (_listData != nil) {
        _nameTextField.text = _listData.pointName;
        _phoneTextField.text = _listData.pointPhone;
        _addressButtonLabel.text = _listData.xpath;
        _addressTextField.text = _listData.pointAddr;
        _legalNameTextField.text = _listData.law;
        _legalPhoneTextField.text = _listData.lawPhone;
        _remakeTextField.text = _listData.remark;
    }
    
    return cell;
    
}
-(void)cellButtonAction:(UIButton *)button {
    
    if (button.tag == 0) {
        AddressViewController *addressVC = [[AddressViewController alloc]init];
        addressVC.delegate = self;
        [self.navigationController pushViewController:addressVC animated:YES];
    }
    
}

-(void)selectedAddress:(NSString *)str and:(NSString *)addressId  {
    
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
