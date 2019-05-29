//
//  NewProbationCustomViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/10.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewProbationCustomViewController.h"
#import "Macro.h"
#import "NewProbationCustomTableViewCell.h"
#import "SGActionView.h"
#import "JCRequest_addProCustom.h"
#import "AddressViewController.h"

@interface NewProbationCustomViewController () <UITableViewDelegate,UITableViewDataSource,AddressDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UITextField *addressTextField;
@property (nonatomic,strong) UITextField *remarkTextFiedl;
@property (nonatomic,strong) NSString    *selectedString;
@property (nonatomic,assign) int         kIndex;
@property (nonatomic,strong) NSArray     *formArray;
@property (nonatomic,strong) UILabel     *buttonLabel;

@property (nonatomic,strong) UILabel     *addressButtonLabel;  //省市区选择
@property (nonatomic,strong) UILabel     *sexButtonLabel;  //性别选择
@property (nonatomic,strong) NSString    *addressId;


@end

@implementation NewProbationCustomViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    _kIndex = 0;
    self.title = @"新增试用客户";
    self.view.backgroundColor =  JCBackgroundColor;
    _formArray = @[ @"客户回馈活动", @"外部活动", @"合作点介绍",@"陌生拜访",@"转介绍",@"其他方式"];
    [self addViews];
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
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
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
    
    return 7;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"NewProbationCustomTableViewCell";
    NewProbationCustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[NewProbationCustomTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    if (indexPath.row == 0)
    {
        cell.titleLabel.text = @"姓名:";
        _nameTextField = cell.contentTextField;
    }
    if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"电话:";
        _phoneTextField = cell.contentTextField;
    }
    if (indexPath.row == 2)
    {
        //选择省市区
        cell.titleLabel.text = @"省市区:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 1;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _addressButtonLabel = cell.buttonLabel;
    }
    
    if (indexPath.row == 3)
    {
        cell.titleLabel.text = @"地址:";
        _addressTextField = cell.contentTextField;

    }
    
    if (indexPath.row == 4)
    {
        cell.titleLabel.text = @"性别:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        cell.button.tag = 2;
        [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        _sexButtonLabel = cell.buttonLabel;
    }
    
    
    if (indexPath.row == 5)
    {
        cell.titleLabel.text = @"来源:";
        cell.button.hidden = NO;
        cell.contentTextField.hidden = YES;
        [cell.button addTarget:self action:@selector(selectedAction) forControlEvents:UIControlEventTouchUpInside];
        _buttonLabel = cell.buttonLabel;
    }
    if (indexPath.row == 6)
    {
        cell.titleLabel.text = @"备注:";
        _remarkTextFiedl = cell.contentTextField;

    }
    
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

//选择来源类型
-(void)selectedAction {
    
    int i = _kIndex;
    
    [SGActionView showSheetWithTitle:@"选择来源类型" itemTitles:_formArray selectedIndex:i selectedHandle:^(NSInteger index) {
        _buttonLabel.text = _formArray[index];
        _kIndex = (int)index;
        _selectedString = [NSString stringWithFormat:@"%d",(int)index];
    }];
    
}

-(void)selectedAddress:(NSString *)str and:(NSString *)addressId  {
    
    _addressButtonLabel.text = str;
    _addressId = addressId;
}

//确定按钮操作
-(void)buttonAction {
    
    JCRequest_addProCustom *request = [[JCRequest_addProCustom alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    
    
    if (_nameTextField.text.length == 0) {
        [self showInfo:@"需要填写姓名"];
        return;
    }
    if (_phoneTextField.text.length == 0) {
        [self showInfo:@"需要填写手机号码"];
        return;
    }
    if (_addressTextField.text.length == 0 ||[_addressButtonLabel.text  isEqual: @"请选择"] ) {
        [self showInfo:@"需要选择地址"];
        return;
    }
    
    if ([_sexButtonLabel.text isEqualToString:@"请选择"]) {
        [self showInfo:@"需要选择性别"];
        return;
    }
    
    
    if ([_buttonLabel.text isEqual:@"请选择"]) {
        [self showInfo:@"需要选择来源"];
        return;
    }
    
    
    
    NSString *token = [JCTokenManager getToken];
    NSString *userId = [JCTokenManager getUserID];

    NSString *sex = [[NSString alloc]init];
    if ([_sexButtonLabel.text isEqual: @"男"]) {
        sex = @"0";
    }else {
        sex = @"1";
    }
    
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"guide":userId,
                                @"name":_nameTextField.text,
                                @"isRegister":@"0",
                                @"phone":_phoneTextField.text,
                                @"address":_addressTextField.text,
                                @"description":_remarkTextFiedl.text,
                                @"from":_selectedString,
                                @"sex":sex,
                                @"areaId":_addressId,
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_addProCustom *request) {
        
        NSDictionary *dic = request.responseJSONObject;
        if ([dic[@"code"] integerValue] != 200)
        {
            NSString *msg = [dic objectForKey:@"msg"];
            [self showInfo:[NSString stringWithFormat:@"%@",msg]];
        }
        else
        {
            [self.delegate newSuccessed];
            [self.navigationController popViewControllerAnimated:YES];
            
        }
        
    } failure:^(__kindof JCRequest_addProCustom *request, NSError *error) {
        NSLog(@"添加试用客户失败 %@",error);
    }];
}

-(void)buttonAction:(UIButton *)button {
    
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
