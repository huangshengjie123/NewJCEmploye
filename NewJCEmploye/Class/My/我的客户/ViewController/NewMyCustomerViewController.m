//
//  NewMyCustomerViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/5.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewMyCustomerViewController.h"
#import "Macro.h"
#import "NewProbationCustomTableViewCell.h"
#import "AddressViewController.h"
#import "SGActionView.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "MBProgressHUD.h"
#import "JCTokenManager.h"
#import "XRModel.h"
#import "MyCustomerViewController.h"
#import "JCRequest_getAllOrgs1.h"
#import "HZQDatePickerView.h"

@interface NewMyCustomerViewController ()<UITableViewDelegate,UITableViewDataSource,AddressDelegate,HZQDatePickerViewDelegate>
{
    
    HZQDatePickerView *_pikerView;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UILabel     *addressButtonLabel;  //省市区选择
@property (nonatomic,strong) UILabel     *sexButtonLabel;  //性别选择
@property (nonatomic,strong) UILabel     *isAnotherPlaceCusLabel;//是否是异地客户
@property (nonatomic,strong) UITextField *remarkTextFiedl;
@property (nonatomic,strong) UITextField *addressDetailedTextField;//地址详情
@property (nonatomic,strong) UITextField *wxTextField;
@property (nonatomic,strong) UITextField *qqTextField;
@property (nonatomic,strong) UITextField *emailTextField;
@property (nonatomic,strong) UITextField *companyTextField;
@property (nonatomic,strong) UITextField *incomeTextField;
@property (nonatomic,strong) UITextField *interestTextField;
@property (nonatomic,strong) UITextField *birthdayTextField;
@property (nonatomic,strong) NSString    *addressId;
@property (nonatomic,strong) NSArray     *orgNameArray;
@property (nonatomic,strong) NSArray     *orgArray;
@property (nonatomic,strong) NSString    *orgId;
@property (nonatomic,assign) BOOL        isAnotherPlaceCus;


@end

@implementation NewMyCustomerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新增客户";
    
    if ([_typeString  isEqual: @"修改"])
    {
        self.title = @"修改客户";
    }
    self.view.backgroundColor =  JCBackgroundColor;
    [self addViews];
    [self readOrgData];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
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

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 14;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

  NSString *identifier = [NSString stringWithFormat:@"NewProbationCustomTableViewCell%ld%ld", (long)[indexPath section], (long)[indexPath row]];//
    NewProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[NewProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    if (indexPath.row == 0)
    {
        cell.titleLabel.text = @"姓名:";
        _nameTextField = cell.contentTextField;
        if (_data != nil)
        {
            _nameTextField.text = _data.name;
        }
    }
    if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"电话:";
        _phoneTextField = cell.contentTextField;
        if (_data != nil)
        {
            _phoneTextField.text = _data.customerDetail.mobile;
            
        }
    }
    if (indexPath.row == 2)
    {
        cell.titleLabel.text = @"省市区:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 1;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _addressButtonLabel = cell.buttonLabel;
        
        
        if (_data.customerAddressList.count > 0)
        {
            JCModel_GetCustmerCustomerAddressList *addresslist = _data.customerAddressList[0];
            _addressButtonLabel.text = addresslist.xpath;
            _addressId = addresslist.areaId;
        }
        
    }
    if (indexPath.row == 3)
    {
        cell.titleLabel.text = @"地址:";
        _addressDetailedTextField = cell.contentTextField;
        
        if (_data.customerAddressList.count > 0)
        {
            JCModel_GetCustmerCustomerAddressList *addresslist = _data.customerAddressList[0];
            _addressDetailedTextField.text = addresslist.address;
          
        }
        
    }
    if (indexPath.row == 4)
    {
        cell.titleLabel.text = @"性别:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 2;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _sexButtonLabel = cell.buttonLabel;
        
        if (_data != nil)
        {
            if (_data.customerDetail.sex == 0)
            {
                _sexButtonLabel.text = @"男";
            }
            else
            {
                _sexButtonLabel.text = @"女";
            }
        }
        
    }
    
    if (indexPath.row == 5)
    {
        cell.titleLabel.text = @"是否异地:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 3;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _isAnotherPlaceCusLabel = cell.buttonLabel;
    
    }
    
    
    if (indexPath.row == 13)
    {
        cell.titleLabel.text = @"微信:";
        _wxTextField = cell.contentTextField;
        _wxTextField.text = _data.customerDetail.weChat;
        if (_data != nil)
        {
            _wxTextField.text = _data.customerDetail.weChat;
            
        }
        
    }
    if (indexPath.row == 7)
    {
        cell.titleLabel.text = @"QQ:";
        _qqTextField = cell.contentTextField;
        _qqTextField.text = _data.customerDetail.qq;
        if (_data != nil)
        {
            _qqTextField.text = _data.customerDetail.qq;
            
        }
        
    }
    if (indexPath.row == 8)
    {
        cell.titleLabel.text = @"邮箱:";
        _emailTextField = cell.contentTextField;
        _emailTextField.text = _data.customerDetail.email;
        if (_data != nil)
        {
            _emailTextField.text = _data.customerDetail.email;
            
        }
        
    }   if (indexPath.row == 9)
    {
        cell.titleLabel.text = @"单位:";
        _companyTextField = cell.contentTextField;
        _companyTextField.text = _data.customerDetail.company;
        if (_data != nil)
        {
            _companyTextField.text = _data.customerDetail.company;

        }
        
    }
    if (indexPath.row == 10)
    {
        cell.titleLabel.text = @"收入:";
        _incomeTextField = cell.contentTextField;
        _incomeTextField.text = _data.customerDetail.income;
        if (_data != nil)
        {
            _remarkTextFiedl.text = _data.customerDetail.customerDetailDescription;
            
        }
        
    }   if (indexPath.row == 11) {
        
        cell.titleLabel.text = @"兴趣:";
        _interestTextField = cell.contentTextField;
        _interestTextField.text = _data.customerDetail.interest;
        if (_data != nil) {
            _remarkTextFiedl.text = _data.customerDetail.customerDetailDescription;
            
        }
        
    }   if (indexPath.row == 12) {
        cell.titleLabel.text = @"备注:";
        _remarkTextFiedl = cell.contentTextField;
        if (_data != nil) {
            _remarkTextFiedl.text = _data.customerDetail.customerDetailDescription;

        }
    }
    
    if (indexPath.row == 6) {
        cell.titleLabel.text = @"生日:";
        _birthdayTextField = cell.contentTextField;
        cell.contentTextField.userInteractionEnabled = NO;
     
        if (_data != nil) {
            _birthdayTextField.text = _data.customerDetail.birthday;
            
        }
    }

    
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 6)
    {
        [self setupDateView:DateTypeOfStart];
    }
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    
    switch (type) {
        case DateTypeOfStart:
            _birthdayTextField.text = [NSString stringWithFormat:@"%@", date];
            
            break;
            
//        case DateTypeOfEnd:
//            _endLabel.text = [NSString stringWithFormat:@"%@", date];
//
//            break;
            
        default:
            break;
    }
}

- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, JCScreen_Width, JCScreen_Height + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    // 今天开始往后的日期
    //    [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    // 在今天之前的日期
    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
}



-(void)buttonAction:(UIButton *)button{
    
    if (button.tag == 0)
    {
        //确定创建按钮
        if (_nameTextField.text.length == 0)
        {
            MBProgressHUD *hud = [[MBProgressHUD alloc]init];
            [self.view addSubview:hud];
            hud.label.text =@"姓名不能为空";
            hud.mode = MBProgressHUDModeText;
            [hud showAnimated:YES];
            [hud hideAnimated:YES afterDelay:1];
            
        }
        else
        {
            if (_phoneTextField.text.length == 0 || _phoneTextField.text.length != 11) {
                
                MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                [self.view addSubview:hud];
                hud.label.text =@"电话没填写或是格式错误";
                hud.mode = MBProgressHUDModeText;
                [hud showAnimated:YES];
                [hud hideAnimated:YES afterDelay:1];
                
            }
            else
            {
                if ([_addressButtonLabel.text  isEqual: @"请选择"] || _addressDetailedTextField.text.length == 0 )
                {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =@"地址不能为空";
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                }
                else
                {
                    // 完成必填的检查 提交
                    
                    if ([_typeString  isEqual: @"修改"])
                    {
                        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                        NSString *token = [JCTokenManager getToken];
                        NSString *accessPath = [NSString stringWithFormat:@"%@customer/updateCustomerById.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                        
                        NSString *sex = [[NSString alloc]init];
                        if ([_sexButtonLabel.text isEqualToString:@"男"])
                        {
                            sex = @"0";
                        }
                        else
                        {
                            sex = @"1";
                        }
                        
                        JCModel_UpdateCustmerInfoBase *base = [[JCModel_UpdateCustmerInfoBase alloc]init];
                        base.internalBaseClassIdentifier = [NSString stringWithFormat:@"%d",(int)_data.dataIdentifier] ;
                        base.name = _nameTextField.text;
                        
                        JCModel_UpdateCustmerInfoCustomerDetail *detail = [[JCModel_UpdateCustmerInfoCustomerDetail alloc]init];
                        detail.mobile = _phoneTextField.text;
                        detail.qq = _qqTextField.text;
                        detail.weChat = _wxTextField.text;
                        detail.sex = sex;
                        detail.customerDetailDescription = _remarkTextFiedl.text;
                        detail.company = _companyTextField.text;
                        detail.interest = _interestTextField.text;
                        detail.areaId = _addressId;
                        base.customerDetail = detail;
                        NSDictionary *params = base.dictionaryRepresentation;
                        
                        NSMutableDictionary *paramDict = [NSMutableDictionary dictionaryWithDictionary:params];
                        NSMutableDictionary *addressDict = [NSMutableDictionary dictionary];
                        [addressDict setValue:_addressId forKey:@"areaId"];
                        NSArray *addressArray = [NSArray arrayWithObject:addressDict];
                        [paramDict setValue:addressArray forKey:@"customerAddressList"];
                        
                        NSLog(@" >>>>>>>>>>>>>>>>>>>>>>%@", [base xr_modelToJSONString]);
                        
                        AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
                        
                        //  params  paramDict
                        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                        NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer]
                                                        requestWithMethod:@"POST" URLString:accessPath parameters:paramDict error:nil];
                        request.timeoutInterval = 10.f;
                        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                        
                        NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                            if (!error) {
                                
                                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                                NSString *result = [dic objectForKey:@"result"];
                                NSString *msg = [dic objectForKey:@"msg"];
                                if ([result isEqualToString:@"success"])
                                {
                                    [self.delegate NewMyCustomerSuccuss2];
//                                    [self.navigationController popToRootViewControllerAnimated:YES];
                                    if (self.navigationController.viewControllers.count >=2)
                                    {
                                        UIViewController *listViewController =self.navigationController.viewControllers[1];
                                        [self.navigationController popToViewController:listViewController animated:YES];
                                        
                                    }
                                    
                                }
                                else
                                {
                                    [self showInfo:msg];
                                }
                                
                            }
                            else
                            {
                                NSLog(@"请求失败error=%@", error);
                            }
                        }];
                        
                        [task resume];
                    }
                    else
                    {
                        
                        if (_isAnotherPlaceCus == YES)
                        {
                            // 请求头
                            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                            NSString *token = [JCTokenManager getToken];
                            NSString *accessPath = [NSString stringWithFormat:@"%@customer/createCustomerTrans.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                            
                            
                            NSString *sex = [[NSString alloc]init];
                            if ([_sexButtonLabel.text isEqualToString:@"男"])
                            {
                                sex = @"0";
                            }
                            else
                            {
                                sex = @"1";
                            }
                            // 请求参数字典
                            JCModel_CreatCustomerBase *base = [[JCModel_CreatCustomerBase alloc]init];
                            
                            base.name = _nameTextField.text;
                            base.type = @"0";
                            if (_orgId != nil)
                            {
                                base.curCom = _orgId;
                            }
                            
                            JCModel_CreatCustomerCustomerDetail *customerDetail = [[JCModel_CreatCustomerCustomerDetail alloc]init];
                            customerDetail.mobile = _phoneTextField.text;
                            customerDetail.sex = sex;
                            customerDetail.weChat = _wxTextField.text;
                            customerDetail.qq = _qqTextField.text;
                            customerDetail.email = _emailTextField.text;
                            customerDetail.company = _companyTextField.text;
                            customerDetail.income = _incomeTextField.text;
                            customerDetail.interest = _interestTextField.text;
                            customerDetail.customerDetailDescription = _remarkTextFiedl.text;
                             customerDetail.birthday = [NSString stringWithFormat:@"%@ %@",_birthdayTextField.text,@"00:00:00"];
                            
                            base.customerDetail = customerDetail;
                            
                            JCModel_GetCustmerCustomerAddressList *addresslist = [[JCModel_GetCustmerCustomerAddressList alloc]init];
                            addresslist.type = @"main";
                            addresslist.address = _addressDetailedTextField.text;
                            addresslist.areaId = _addressId;
                            
                            NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:10];
                            [array2 addObject:addresslist];
                            base.customerAddressList = array2;
                            
                            NSDictionary *params = base.dictionaryRepresentation;
                            
                            NSLog(@" >>>>>>>>>>>>>>>>>>>>>>%@", [base xr_modelToJSONString]);
                            
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
                                    
                                    if ([result isEqualToString:@"success"])
                                    {
                                        //下一步拒绝成功  直接返回,重新刷新列表
                                        [self.delegate NewMyCustomerSuccuss2];
                                        [self.navigationController popViewControllerAnimated:YES];
                                    }
                                    else
                                    {
                                        if ([msg  isEqual: @"mobile has exist"])
                                        {
                                            [self showInfo:@"你填写的手机号，已被别人使用"];
                                        }
                                         [self showInfo:msg];
                                        NSLog(@"%@",msg);
                                    }
                                    
                                }
                                else
                                {
                                    NSLog(@"请求失败error=%@", error);
                                }
                            }];
                            
                            [task resume];
                            
                            
                        }
                        else
                        {
                            // 请求头
                            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                            NSString *token = [JCTokenManager getToken];
                            NSString *accessPath = [NSString stringWithFormat:@"%@customer/createCustomer.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                            
                            NSString *userId = [JCTokenManager getUserID];
                            
                            NSString *sex = [[NSString alloc]init];
                            if ([_sexButtonLabel.text isEqualToString:@"男"])
                            {
                                sex = @"0";
                            }
                            else
                            {
                                sex = @"1";
                            }
                            // 请求参数字典
                            JCModel_CreatCustomer2Base *base = [[JCModel_CreatCustomer2Base alloc]init];
                            
                            base.guide = userId;
                            base.name = _nameTextField.text;
                            base.type = @"0";
                            JCModel_CreatCustomer2CustomerDetail *customerDetail = [[JCModel_CreatCustomer2CustomerDetail alloc]init];
                            customerDetail.mobile = _phoneTextField.text;
                            customerDetail.sex = sex;
                            customerDetail.weChat = _wxTextField.text;
                            customerDetail.qq = _qqTextField.text;
                            customerDetail.email = _emailTextField.text;
                            customerDetail.company = _companyTextField.text;
                            customerDetail.income = _incomeTextField.text;
                            customerDetail.interest = _interestTextField.text;
                            customerDetail.customerDetailDescription = _remarkTextFiedl.text;
//                            customerDetail.birthday = @"2010-09-20 10:20:34";
                            
                            if (_birthdayTextField.text.length == 0)
                            {
                                customerDetail.birthday = NULL;
                            }
                            else
                            {
                                customerDetail.birthday = [NSString stringWithFormat:@"%@ %@",_birthdayTextField.text,@"00:00:00"];
                            }
                            
                            base.customerDetail = customerDetail;
                            
                            JCModel_CreatCustomer2CustomerAddressList *addresslist = [[JCModel_CreatCustomer2CustomerAddressList alloc]init];
                            addresslist.type = @"main";
                            addresslist.address = _addressDetailedTextField.text;
                            addresslist.areaId = _addressId;
                            
                            NSMutableArray *array2 = [NSMutableArray arrayWithCapacity:10];
                            [array2 addObject:addresslist];
                            base.customerAddressList = array2;
                            
                            NSDictionary *params = base.dictionaryRepresentation;
                            
                            NSLog(@" >>>>>>>>>>>>>>>>>>>>>>%@", [base xr_modelToJSONString]);
                            
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
                                    
                                    if ([result isEqualToString:@"success"]) {
                                        //下一步拒绝成功  直接返回,重新刷新列表
                                        [self.delegate NewMyCustomerSuccuss2];
                                        [self.navigationController popViewControllerAnimated:YES];
                                    }else {
                                        
                                        if ([msg  isEqual: @"mobile has exist"]) {
                                            [self showInfo:@"你填写的手机号，已被别人使用"];
                                            
                                        }
                                        [self showInfo:msg];
                                        NSLog(@"%@",msg);
                                    }
                                    
                                } else {
                                    NSLog(@"请求失败error=%@", error);
                                }
                            }];
                            
                            [task resume];
                            

                            
                        }
                        
                        
                        
                    }
                    
                }
            }
        }
        
    
    }
    
    if (button.tag == 1) {
        //选择省市区
        AddressViewController *addressVC = [[AddressViewController alloc]init];
        addressVC.delegate = self;
        [self.navigationController pushViewController:addressVC animated:YES];
        
    }
    
    if (button.tag == 2) {
        //选择性别
        
        NSArray *array = @[@"男",@"女"];
        
        [SGActionView showSheetWithTitle:@"选择性别" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
          
            _sexButtonLabel.text = array[index];
            
            
            
        }];
    }
    if (button.tag == 4) {
        
    }
    
    if (button.tag == 3) {
        NSArray *array = @[@"是（并继续选择市场）",@"否"];
        
        [SGActionView showSheetWithTitle:@"是否是异地客户" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            NSLog(@"%ld",(long)index);
            
            if (index == 1) {
                _isAnotherPlaceCusLabel.text = array[index];
                _isAnotherPlaceCus = NO;

            }
            
            if (index == 0) {
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    
                    [SGActionView showSheetWithTitle:@"选择异地分公司" itemTitles:_orgNameArray selectedIndex:-1 selectedHandle:^(NSInteger index) {
                        
                        _isAnotherPlaceCusLabel.text = [NSString stringWithFormat:@"是，%@",_orgNameArray[index]];
                        JCModel_baseOrgNodes *data = _orgArray[index];
                        _orgId = data.orgId;
                        _isAnotherPlaceCus = YES;
                    }];
                });
            
            
            }
            
        }];
    }
}

-(void)readOrgData {
    
    JCRequest_getAllOrgs1 *request = [[JCRequest_getAllOrgs1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getAllOrgs1 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_baseOrgBase *base =[[JCModel_baseOrgBase alloc]initWithDictionary:dic];
        
        if (base.data.count >0) {
            JCModel_baseOrgData *data = base.data[0];
            _orgArray =data.nodes;
            
            NSMutableArray *mutableArray = [NSMutableArray arrayWithCapacity:50];
            
            for (int i = 0; i< data.nodes.count; i++) {
                
                JCModel_baseOrgNodes *node = data.nodes[i];
                
                [mutableArray addObject:node.orgName];
                
            }
            
            _orgNameArray = mutableArray;
            
        }
        
    } failure:^(__kindof JCRequest_getAllOrgs1 *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(void)selectedAddress:(NSString *)str and:(NSString *)addressId  {
    
    NSLog(@"addressId:::::::::::%@",addressId);
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
