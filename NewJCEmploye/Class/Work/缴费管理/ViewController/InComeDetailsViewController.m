//
//  InComeDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/8.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "InComeDetailsViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "DataModels.h"
#import "SGActionView.h"
#import "LCNetworkConfig.h"

@interface InComeDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UITextField *commentTextField;
@property (nonatomic,strong) UILabel *typeLabel;
@end

@implementation InComeDetailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"其他收入";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-80);
    }];
    
    
    NSString *financial = [JCTokenManager sgetFinancial];
    
    if ([financial  isEqual: @"是财务"])
    {
        if ([_listData.status  isEqual: Financial_create])
        {
            [self addTwoButton];
        }
    }

}
-(void)addTwoButton{
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    UIButton *leftbutton = [[UIButton alloc]init];
    leftbutton.backgroundColor = JCColorBlue;
    [self.view addSubview:leftbutton];
    [leftbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-40);
        make.height.equalTo(@(40));
    }];
    leftbutton.tag = 0;
    [leftbutton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"注销";
    label.textColor = JCColorWithe;
    label.font = JCFont14;
    [leftbutton addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(leftbutton);
        make.centerY.equalTo(leftbutton);
    }];
    leftbutton.layer.masksToBounds = YES;
    leftbutton.layer.cornerRadius = 4;
    leftbutton.hidden = NO;

    
    UIButton *rightButton = [[UIButton alloc]init];
    rightButton.backgroundColor = JCColorBlue;
    [self.view addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftbutton.mas_right).offset(20);
        make.width.equalTo(@(w));
        make.height.equalTo(@(40));
        make.centerY.equalTo(leftbutton);
    }];
    rightButton.tag = 1;
    [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    rightButton.layer.masksToBounds = YES;
    rightButton.layer.cornerRadius = 4;
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorWithe;
    label2.font = JCFont14;
    label2.text = @"确认";
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(rightButton);
        make.centerX.equalTo(rightButton);
    }];
    
    
}
-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 1)
    {
        //审批通过
        if ([_typeLabel.text  isEqual: @"请选择"])
        {
            [self showInfo: @"请选择收款方式"];
        }
        else
        {
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@completeIncome.mdo?isAppLogin=true&jc4login=%@",config.viceBaseUrl,token];
            
            // 请求参数字典
            JCModel_agreeOtherIncomeBase *base = [[JCModel_agreeOtherIncomeBase alloc]init];
            base.internalBaseClassIdentifier = _listData.listIdentifier;
          
            base.payment = [JCTool payment2:_typeLabel.text];
            base.comment = _commentTextField.text;
    
            NSDictionary *params = base.dictionaryRepresentation;
            
            NSLog(@"%@",params);
            
            [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
                
                if ([responseDic[@"code"] integerValue] == 200)
                {
                    [self showInfo:@"提交成功"];
                    [self.delegate detailsActionSuccessDelegate];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else
                {
                    [self showInfo:responseDic[@"msg"]];
                }
                
            } failure:^(NSError *error) {
                
            }];
        }
    }
    
    if (button.tag == 0)
    {
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@cancelIncome.mdo?isAppLogin=true&jc4login=%@",config.viceBaseUrl,token];
        
        // 请求参数字典
        JCModel_cancelIncomebase *base = [[JCModel_cancelIncomebase alloc]init];
        base.internalBaseClassIdentifier = _listData.listIdentifier;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self showInfo:@"注销成功"];
                [self.delegate detailsActionSuccessDelegate];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0)
    {
        cell.titleLabel.text = @"状态";
        if ([_listData.status  isEqual: Financial_create])
        {
            cell.contentLabel.text = @"待确认";
        }
        if ([_listData.status  isEqual: Financial_completed])
        {
            cell.contentLabel.text = @"完成";
        }
        if ([_listData.status  isEqual: Financial_cancel])
        {
            cell.contentLabel.text = @"取消";
        }
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"收入类别";
        if ([_listData.type  isEqual: Financial_sale_olds])
        {
            cell.contentLabel.text = @"卖废品";
        }
        if ([_listData.type  isEqual: Financial_donation])
        {
            cell.contentLabel.text = @"乐捐";
        }
        cell.arrowImageView.hidden = YES;

    }
    if (indexPath.row == 2)
    {
        cell.titleLabel.text = @"收入金额";
        cell.contentLabel.text = [NSString stringWithFormat:@"￥  %d",(int)_listData.amount];
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 3)
    {
        cell.titleLabel.text = @"收入方式";
        _typeLabel = cell.contentLabel;
        if ([_listData.status  isEqual: Financial_create])
        {
           cell.contentLabel.text = @"请选择";
        }
        else
        {
            cell.arrowImageView.hidden = YES;
           _typeLabel.text =[JCTool payment:_listData.payment];
        }
    }
    if (indexPath.row == 4)
    {
        cell.titleLabel.text = @"交款时间";
        cell.contentLabel.text = @"2018-09-10 12:10:10";
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 5)
    {
        cell.titleLabel.text = @"备注";
        cell.titleLabel.text = @"收入金额";
        UITextField *textfield = [[UITextField alloc]init];
        [cell.contentView addSubview:textfield];
        [textfield mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(cell.contentView).offset(-10);
            make.centerY.equalTo(cell.contentView);
        }];
        cell.arrowImageView.hidden = YES;
        textfield.placeholder = @"请填写备注";
        _commentTextField = textfield;
        _commentTextField.font = JCFont14;
        _commentTextField.textColor = JCColorBlack;
        _commentTextField.textAlignment = NSTextAlignmentRight;
        _commentTextField.text = _listData.comment;

    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 3)
    {
        NSArray *array = @[@"现金",@"支付宝",@"微信",@"转账"];
        [SGActionView showSheetWithTitle:@"选择支付方式" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            _typeLabel.text = array[index];
            
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
