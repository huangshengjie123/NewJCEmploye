//
//  NewOtherIncomeViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/8.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewOtherIncomeViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "SGActionView.h"
@interface NewOtherIncomeViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *priceTextField;
@property (nonatomic,strong) UITextField *commentTextField;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *commentLabel;


@end

@implementation NewOtherIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"新增缴费";
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
    
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
    NSString *accessPath = [NSString stringWithFormat:@"%@createIncome.mdo?isAppLogin=true&jc4login=%@",config.viceBaseUrl,token];
    
    // 请求参数字典
    JCModel_NewOtherIncomeBase *base = [[JCModel_NewOtherIncomeBase alloc]init];
    if ([_titleLabel.text  isEqual: @"请选择"])
    {
        [self showInfo:@"请选择来源类型"];
    }
    else
    {
        if (_priceTextField.text.length ==0)
        {
            [self showInfo:@"请填写金额"];
        }
        else
        {
            if ([_titleLabel.text  isEqual: @"乐捐"])
            {
                base.type = Financial_donation;
            }
            if ([_titleLabel.text  isEqual: @"卖废品"])
            {
                base.type = Financial_sale_olds;
            }
            
            base.amount = _priceTextField.text.doubleValue;
        }
    }
    
    base.comment=_commentTextField.text;
    
    NSDictionary *params = base.dictionaryRepresentation;
    
    [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            [self showInfo:@"提交成功"];
            [self.delegate newOtherIncomeSuccess];
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
        
    } failure:^(NSError *error) {
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
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
        cell.titleLabel.text = @"收入类别";
        cell.contentLabel.text = @"请选择";
        _titleLabel = cell.contentLabel;
    }
    
    if (indexPath.row == 1) {
        cell.titleLabel.text = @"收入金额";
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
        _priceTextField.placeholder = @"请输入金额";
    }

    
    if (indexPath.row == 2) {
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
        _commentTextField.placeholder = @"请填写备注";
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        
        NSArray *array = @[@"卖废品",@"乐捐"];
        
        [SGActionView showSheetWithTitle:@"选择收入类别" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _titleLabel.text = array[index];
            
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
