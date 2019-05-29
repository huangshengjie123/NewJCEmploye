//
//  NewInterstIncomeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/13.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewInterstIncomeViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "PersonDetailsTableViewCell.h"
#import "LCNetworkConfig.h"
#import "HZQDatePickerView.h"
#import "WorkGroupSeletedViewController.h"
#import "SGActionView.h"
@interface NewInterstIncomeViewController ()<UITableViewDelegate,UITableViewDataSource,HZQDatePickerViewDelegate,NewMyGroupDelegate>
{
    
    HZQDatePickerView *_pikerView;
}
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *nameTextField;
@property (nonatomic,strong) UITextField *phoneTextField;
@property (nonatomic,strong) UILabel *longtimeLabel;//借款时长
@property (nonatomic,strong) UILabel *repaymentTimesLabel;//还款期数
@property (nonatomic,strong) UITextField *blankNameTextField;//银行名
@property (nonatomic,strong) UITextField *blankCardTextField;//银行卡号

@property (nonatomic,strong) UILabel *starttimeLabel;//开始
@property (nonatomic,strong) UILabel *endtimeLabel;//结束
@property (nonatomic,strong) UILabel *nameLabel;//借款人姓名
@property (nonatomic,assign) double nameuserID;//借款人id
@property (nonatomic,strong) UITextField *priceTextField;//借款金额
@property (nonatomic,strong) UITextField *interestTextField;//借款利息
@property (nonatomic,strong) UITextField *userCardTextField;//身份证号
@property (nonatomic,strong) UILabel *interesttypeLabel;//利息类型
@property (nonatomic,strong) UITextField *commentTextField;//备注



@end

@implementation NewInterstIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新增个人借款合同";
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
        make.height.equalTo(@(200));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40));
    }];
    
    UILabel *label= [[UILabel alloc]init];
    label.text = @"提交";
    label.textColor = JCColorWithe;
    label.font = JCFont14;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(button);
    }];
    
    [button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
}

-(void)buttonAction {
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@createLoan.mdo?isAppLogin=true&jc4login=%@",config.viceBaseUrl,token];
    
    // 请求参数字典
    JCModel_newInterstIncomeBase *base = [[JCModel_newInterstIncomeBase alloc]init];
    base.createTime= [NSString stringWithFormat:@"%@ 00:00:00",_starttimeLabel.text];
    base.checkTime= [NSString stringWithFormat:@"%@ 00:00:00",_endtimeLabel.text];
    base.amount = _priceTextField.text.doubleValue;
    base.shouldInterests = _interestTextField.text.doubleValue;
    base.shouldAmount = _priceTextField.text.doubleValue;
    base.status = @"create";
    base.type = @"pdc";
    
    if ([_interesttypeLabel.text  isEqual:@"按天"]) {
        base.rateType = @"day";
    }
    
    if ([_interesttypeLabel.text  isEqual:@"固定"]) {
        base.rateType = @"fixed";
    }
    
    base.debit =  _nameuserID;
//    base.credit = 101;

    base.cdid = _userCardTextField.text;
//    base.bank = @"中国银行";
//    base.card = @"62131829381283819023912";
    base.comment = _commentTextField.text;
    
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
            NSLog(@"%@",dic);
            if ([result isEqualToString:@"success"]) {
                
                [self showInfo:@"提交成功"];
//                [self.delegate newOtherIncomeSuccess];
                [self.navigationController popViewControllerAnimated:YES];
                
            }else {
                [self showInfo:msg];
                NSLog(@"%@",msg);
            }
        } else {
            NSLog(@"请求失败error=%@", error);
        }
    }];
    
    [task resume];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 8;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0) {

        cell.titleLabel.text = @"开始时间";
        cell.contentLabel.text = @"请选择";
        _starttimeLabel = cell.contentLabel;
    }
    
    if (indexPath.row == 1) {

        cell.titleLabel.text = @"到期时间";
        cell.contentLabel.text = @"请选择";
        _endtimeLabel = cell.contentLabel;
    }
    
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"借款人";
        cell.contentLabel.text = @"请选择";
        _nameLabel = cell.contentLabel;
    }
    
    if (indexPath.row == 3) {
        cell.titleLabel.text = @"借款金额";
        UITextField *textfield = [[UITextField alloc]init];
        [cell.contentView addSubview:textfield];
        [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell.contentView).offset(-10);
            make.centerY.equalTo(cell.contentView);
        }];
        cell.arrowImageView.hidden = YES;
        _priceTextField = textfield;
        _priceTextField.textAlignment = NSTextAlignmentRight;
        _priceTextField.keyboardType =UIKeyboardTypeNumberPad;
        _priceTextField.placeholder = @"请输入借款金额";
    }
    
    if (indexPath.row == 4) {
   
        cell.titleLabel.text = @"借款利息";
        UITextField *textfield = [[UITextField alloc]init];
        [cell.contentView addSubview:textfield];
        [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell.contentView).offset(-10);
            make.centerY.equalTo(cell.contentView);
        }];
        cell.arrowImageView.hidden = YES;
        _interestTextField = textfield;
        _interestTextField.textAlignment = NSTextAlignmentRight;
        _interestTextField.keyboardType =UIKeyboardTypeNumberPad;
        _interestTextField.placeholder = @"请输入借款金额";
    }
    
    if (indexPath.row == 5) {
        
        cell.titleLabel.text = @"身份证号码";
                UITextField *textfield = [[UITextField alloc]init];
                [cell.contentView addSubview:textfield];
                [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.right.equalTo(cell.contentView).offset(-10);
                    make.centerY.equalTo(cell.contentView);
                }];
                cell.arrowImageView.hidden = YES;
                _userCardTextField = textfield;
                _userCardTextField.textAlignment = NSTextAlignmentRight;
                _userCardTextField.keyboardType =UIKeyboardTypeNumberPad;
                _userCardTextField.placeholder = @"请输入身份证号码";
    }
    if (indexPath.row == 6) {
        
        cell.titleLabel.text = @"利率类型";
        cell.contentLabel.text = @"请选择";
        _interesttypeLabel = cell.contentLabel;
    }
    
   
    if (indexPath.row == 7) {
        cell.titleLabel.text = @"备注";
        UITextField *textfield = [[UITextField alloc]init];
        [cell.contentView addSubview:textfield];
        [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell.contentView).offset(-10);
            make.centerY.equalTo(cell.contentView);
        }];
        cell.arrowImageView.hidden = YES;
        _commentTextField = textfield;
        _commentTextField.textAlignment = NSTextAlignmentRight;
        _commentTextField.keyboardType =UIKeyboardTypeNumberPad;
        _commentTextField.placeholder = @"请输入备注";
    }
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
          [self setupDateView:DateTypeOfStart];
        
    }
    
    if (indexPath.row == 1) {
        
        [self setupDateView:DateTypeOfEnd];
        
    }
    
    if (indexPath.row == 2) {
        
        WorkGroupSeletedViewController *vc = [[WorkGroupSeletedViewController alloc]init];
        vc.delegate = self;
        vc.ismMultiselect = NO;
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    if (indexPath.row == 6) {
        
        NSArray *array = @[@"按天",@"固定"];
        
        [SGActionView showSheetWithTitle:@"选择利率类型" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _interesttypeLabel.text = array[index];
            
        }];
        
    }
    
}

- (void)setupDateView:(DateType)type {
    
    _pikerView = [HZQDatePickerView instanceDatePickerView];
    _pikerView.frame = CGRectMake(0, 0, JCScreen_Width, JCScreen_Height + 20);
    [_pikerView setBackgroundColor:[UIColor clearColor]];
    _pikerView.delegate = self;
    _pikerView.type = type;
    //     今天开始往后的日期
    //        [_pikerView.datePickerView setMinimumDate:[NSDate date]];
    //    // 在今天之前的日期
//    [_pikerView.datePickerView setMaximumDate:[NSDate date]];
    [self.view addSubview:_pikerView];
    
}

- (void)getSelectDate:(NSString *)date type:(DateType)type {
    NSLog(@"%d - %@", type, date);
    
    switch (type) {
        case DateTypeOfStart:
            _starttimeLabel.text = [NSString stringWithFormat:@"%@", date];
            
            break;
            
        case DateTypeOfEnd:
            _endtimeLabel.text = [NSString stringWithFormat:@"%@", date];
            
            break;
            
        default:
            break;
    }
}

-(void)NewMyGroup:(JCModel_employeeInfoData *)data {
    
    _nameLabel.text = data.name;
    _nameuserID = data.dataIdentifier;

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
