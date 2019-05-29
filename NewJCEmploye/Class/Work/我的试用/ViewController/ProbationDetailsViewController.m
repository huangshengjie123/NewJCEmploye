//
//  ProbationDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ProbationDetailsViewController.h"
#import "Macro.h"
#import "ItemsTableViewCell.h"
#import "LCNetworkConfig.h"
#import "MBProgressHUD.h"
#import "SGActionView.h"

@interface ProbationDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UILabel *nameLabel; //姓名
@property (nonatomic,strong) UILabel *phoneLabel; //手机
@property (nonatomic,strong) UILabel *addressLabel; //地址
@property (nonatomic,strong) UILabel *stateLabel; //状态
@property (nonatomic,strong) UILabel *remakeLabel; //备注
@property (nonatomic,strong) UIView  *midView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UILabel *numLabel;//编号

@property (nonatomic,strong) UIButton *extendedButton; // 延长试用
@property (nonatomic,strong) UIButton *conversionButton; //转换试用
@property (nonatomic,strong) UIButton *withdrawButton;// 已收回
@property (nonatomic,strong) UIButton *nextButton;  // 下一步按钮

@end

@implementation ProbationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"试用详情";
    self.view.backgroundColor = JCBackgroundColor;
    NSLog(@">>>>>>>>>%@",_probationOrderList);
    [self addViews];
}

-(void)addViews {
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
       
    }];
    
    _nameLabel = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont14;
    
    [topView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.top.equalTo(topView.mas_top).offset(10);
    }];
    
    _phoneLabel = [[UILabel alloc]init];
    _phoneLabel.textColor = JCColorBlack;
    _phoneLabel.font = JCFont14;
    [topView addSubview:_phoneLabel];
    [_phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView.mas_right).offset(-10);
        make.centerY.equalTo(_nameLabel);
    }];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont14;
    _addressLabel.numberOfLines = 0;
    [topView addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.right.equalTo(topView).offset(-10);
        make.top.equalTo(_nameLabel.mas_bottom).offset(6);
    }];
    
    [topView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 5);
        make.bottom.equalTo(_addressLabel.mas_bottom).offset(10);
    }];
    
    _midView = [[UIView alloc]init];
    _midView.backgroundColor = JCColorWithe;
    [self.view addSubview:_midView];
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(5);
        make.height.equalTo(@(90/2 + 30));
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorBlack;
    label2.font = JCFont14;
    label2.text = @"状态:";
    [_midView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(_midView).offset(10);
    }];

    _stateLabel = [[UILabel alloc]init];
    _stateLabel.textColor = JCColorWithe;
    _stateLabel.backgroundColor = JCColorMidGray;
    _stateLabel.font = [UIFont boldSystemFontOfSize:12];
    [_midView addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];
    _stateLabel.layer.masksToBounds = YES;
    _stateLabel.layer.cornerRadius = 2;
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text =@"编号:";
    label4.textColor = JCColorBlack;
    label4.font = JCFont14;
    [_midView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label2.mas_bottom).offset(8);

    }];
    _numLabel = [[UILabel alloc]init];
    _numLabel.textColor = JCColorBlack;
    _numLabel.font = JCFont14;
    [_midView addSubview:_numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(6);
        make.centerY.equalTo(label4);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorBlack;
    label.font = JCFont14;
    label.text = @"物品:";
    [_midView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label4.mas_bottom).offset(8);
    }];
    
    //数据填充
    if (_probationOrderList == nil && _listData != nil) {
        
        _nameLabel.text = _listData.customerPrepare.name;
        _phoneLabel.text = _listData.customerPrepare.phone;
        _addressLabel.text = [NSString stringWithFormat:@"%@%@",_listData.customerPrepare.xpath,_listData.customerPrepare.address];
        _stateLabel.text = [JCTool applicationSupport:_listData.status];
        _numLabel.text = _listData.franProbation.franProbationIdentifier;

    }
    else
    {
        
        _nameLabel.text = _probationOrderList.customer.name;
        _phoneLabel.text = _probationOrderList.customer.phone;
        _addressLabel.text = _probationOrderList.customer.address;
        _stateLabel.text = [JCTool determinesProbationStatusSringWith:_probationOrderList.status];
        _numLabel.text = _probationOrderList.listIdentifier;
    }
    
    _dataArray = @[@"酸枝木饮水机",@"吉善泉带装水",@"椎管"];
    
    [self addTableView];
    
    [self addremakeView];
    
    if (_isReadOfLeader == YES)
    {
        
    }
    else
    {
        
        if ([_probationOrderList.status  isEqual: probation_send])
        {
            NSLog(@"送试用状态");
            [self addNextButton];
        }
        
        if ([_probationOrderList.status isEqual:probation_return_visit])
        {
            NSLog(@"客户回访");
            [self addThreeButton];
        }
        
        if ([_listData.status isEqualToString:@"fgs_probation_back"])
        {
            //经销商客户支持回访
            [self addTWOButton2];
        }
        
        if ([_probationOrderList.status isEqual:@"f_probation_send"])
        {
            NSLog(@"经销商送试用");
            [self addFTwoButton];
        }
        
        if ([_probationOrderList.status isEqual:@"f_probation_visit"])
        {
            NSLog(@"经销商回访");
            [self addTwoButton];
        }
        
        //领导审批
        if ([_probationOrderList.status isEqualToString:probation_leader_check])
        {
            [self addLeaderCheckButton];
        }
    }
}
-(void)addTwoButton {
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"未成交" forState:UIControlStateNormal];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button1.tag  = 8;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"成交" forState:UIControlStateNormal];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button2.tag  = 9;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
}

-(void)addFTwoButton {
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"试用取消" forState:UIControlStateNormal];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button1.tag  = 7;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button2 = [[UIButton alloc]init];
    [button2 setTitle:@"试用下一步" forState:UIControlStateNormal];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button2.tag  = 6;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
    
}

-(void)addLeaderCheckButton {
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [UIButton buttonWithType:UIButtonTypeCustom];
    [button1 setTitle:@"拒绝申请" forState:UIControlStateNormal];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button1.tag  = 3;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [button2 setTitle:@"同意申请" forState:UIControlStateNormal];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button2.tag  = 4;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
}


-(void)addTableView {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCColorWithe;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_midView.mas_bottom);
        make.height.equalTo(@(self.probationOrderList.probationCosts.count * (25)));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.userInteractionEnabled = NO;
    
    
    if (_probationOrderList == nil && _listData != nil) {
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_midView.mas_bottom);
            make.height.equalTo(@(self.listData.franProbation.probationCosts.count * (25)));
        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.userInteractionEnabled = NO;
        
    }else {
        
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_midView.mas_bottom);
            make.height.equalTo(@(self.probationOrderList.probationCosts.count * (25)));
        }];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.tableView.userInteractionEnabled = NO;
    }
        
}

-(void)addremakeView  {
    
    UIView *remakeView = [[UIView alloc]init];
    remakeView.backgroundColor = JCColorWithe;
    [self.view addSubview:remakeView];
    [remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
    }];
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"备注:";
    label4.font = JCFont14;
    label4.textColor = JCColorBlack;
    [remakeView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(remakeView).offset(10);
        make.top.equalTo(remakeView).offset(10);
    }];
    
    _remakeLabel = [[UILabel alloc]init];
    if ([_probationOrderList.comments  isEqual:@""]) {
        _remakeLabel.text = @"没有备注信息";
        _remakeLabel.textColor = JCColorMidGray;

    }else {
        _remakeLabel.text = _probationOrderList.comments;
        
    }
    
    if ([_listData.comments  isEqual:@""]) {
        _remakeLabel.text = @"没有备注信息";
        _remakeLabel.textColor = JCColorMidGray;
        
    }else {
        _remakeLabel.text = _listData.comments;
        
    }
    
    _remakeLabel.font = JCFont14;
    _remakeLabel.textColor = JCColorBlack;
    _remakeLabel.numberOfLines = 0;
    [remakeView addSubview:_remakeLabel];
    [_remakeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);
        make.right.equalTo(remakeView.mas_right).offset(-10);
        make.top.equalTo(label4);
    }];
    
    [remakeView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
        make.bottom.equalTo(_remakeLabel.mas_bottom).offset(10);
    }];
    
}

-(void)addNextButton {
    
    _nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    _nextButton.backgroundColor = JCColorBlue;
    [self.view addSubview:_nextButton];
    [_nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.right.equalTo(self.view).offset(-20);
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    _nextButton.layer.masksToBounds = YES;
    _nextButton.layer.cornerRadius = 4;
    _nextButton.tag = 1;
    [_nextButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
}

-(void)addThreeButton {
    
    float w = (JCScreen_Width - 20 * 3) / 2;

    _extendedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_extendedButton setTitle:@"未成交" forState:UIControlStateNormal];
    _extendedButton.backgroundColor = JCColorWithe;
    [self.view addSubview:_extendedButton];
    [_extendedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-40);
        make.height.equalTo(@(40));
    }];
    _extendedButton.tag = 0;
    [_extendedButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _extendedButton.layer.masksToBounds = YES;
    _extendedButton.layer.cornerRadius = 4;
    _extendedButton.hidden = NO;

    if (_probationOrderList.hasOut != nil || _probationOrderList.hasOut != 0) {
        _extendedButton.hidden = NO;
    }
    
    
    _conversionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_conversionButton setTitle:@"成交" forState:UIControlStateNormal];
    _conversionButton.backgroundColor = JCColorBlue;
    [self.view addSubview:_conversionButton];
    [_conversionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_extendedButton.mas_right).offset(20);
        make.width.equalTo(@(w));
        make.height.equalTo(@(40));
        make.centerY.equalTo(_extendedButton);
    }];
    _conversionButton.tag = 2;
    [_conversionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

    _conversionButton.layer.masksToBounds = YES;
    _conversionButton.layer.cornerRadius = 4;
    
}

-(void)addTWOButton2 {
    
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    _extendedButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_extendedButton setTitle:@"未成交" forState:UIControlStateNormal];
    _extendedButton.backgroundColor = JCColorWithe;
    [self.view addSubview:_extendedButton];
    [_extendedButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-40);
        make.height.equalTo(@(40));
    }];
    _extendedButton.tag = 10;
    [_extendedButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    _extendedButton.layer.masksToBounds = YES;
    _extendedButton.layer.cornerRadius = 4;
    _extendedButton.hidden = NO;
    
    if (_probationOrderList.hasOut != nil || _probationOrderList.hasOut != 0) {
        _extendedButton.hidden = NO;
    }
    
    
    _conversionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_conversionButton setTitle:@"成交" forState:UIControlStateNormal];
    _conversionButton.backgroundColor = JCColorBlue;
    [self.view addSubview:_conversionButton];
    [_conversionButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_extendedButton.mas_right).offset(20);
        make.width.equalTo(@(w));
        make.height.equalTo(@(40));
        make.centerY.equalTo(_extendedButton);
    }];
    _conversionButton.tag = 11;
    [_conversionButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    _conversionButton.layer.masksToBounds = YES;
    _conversionButton.layer.cornerRadius = 4;
    
}

-(void)buttonAction:(UIButton *)button{
    // tag = 0  未成交   1 下一步  2 成交
    
    if (button.tag == 0) {
        //未成交
//        ExtendedViewController *extendedVC = [[ExtendedViewController alloc]init];
//        [self.navigationController pushViewController:extendedVC animated:YES];
        
        
    }
    
    if (button.tag == 1)
    {
        //下一步
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_ProbationNextBase *base = [[JCModel_ProbationNextBase alloc]init];
        base.command = @"next";
        base.current = probation_send ;
        JCModel_ProbationNextProbation *probation = [[JCModel_ProbationNextProbation alloc]init];;
        probation.probationIdentifier = _probationOrderList.listIdentifier;
        base.probation = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                _nextButton.hidden = YES;
                [self addThreeButton];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];

    }
    
    if (button.tag == 2 || button.tag == 0)
    {
        NSArray *array = @[@"是",@"否"];
        
        //设置选择框  -1 是为了什么都不选
        [SGActionView showSheetWithTitle:@"是否将试用设备入库" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            //成交
            // 请求头
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_Probation_return_visitBase *base = [[JCModel_Probation_return_visitBase alloc]init];
            base.command = @"next";

            base.current = probation_return_visit ;
            if (index == 0) {
                base.isInStore = true;
            }
            
            if (index == 1) {
                base.isInStore = false;
            }
            
            if (button.tag == 0) {
                base.isDeal = false;
//                base.command = @"stop";


            }
            if (button.tag == 2) {
                base.isDeal = true;

            }
            
            JCModel_Probation_return_visitProbation *probation = [[JCModel_Probation_return_visitProbation alloc]init];;
            
            probation.probationIdentifier = _probationOrderList.listIdentifier;
            
            base.probation = probation;
            NSDictionary *params = base.dictionaryRepresentation;
            

            [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
                
                if ([responseDic[@"code"] integerValue] == 200)
                {
                    [self.delegate takeProbationSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else
                {
                    [self showInfo:responseDic[@"msg"]];
                }
                
            } failure:^(NSError *error) {
                
            }];
        }];
    
    }
    
    if (button.tag == 3)
    {
        //拒绝申请
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_LeaderCheckBase *base = [[JCModel_LeaderCheckBase alloc]init];
        
        base.command = @"next";
        base.current = probation_leader_check ;
        base.leaderPass = false;
        JCModel_LeaderCheckProbation *probation = [[JCModel_LeaderCheckProbation alloc]init];;
        
        probation.probationIdentifier = _probationOrderList.listIdentifier;
        
        base.probation = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
    }
    
    if (button.tag == 4)
    {
        //同意申请
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_LeaderCheckBase *base = [[JCModel_LeaderCheckBase alloc]init];
        base.command = @"next";
        base.current = probation_leader_check ;
        base.leaderPass = true;
        JCModel_LeaderCheckProbation *probation = [[JCModel_LeaderCheckProbation alloc]init];;
        probation.probationIdentifier = _probationOrderList.listIdentifier;
        base.probation = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
    
    }

    if (button.tag == 6) {
        //经销商下一步
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_ProbationNextBase *base = [[JCModel_ProbationNextBase alloc]init];
        
        base.command = @"next";
        base.current = @"f_probation_send" ;
        JCModel_ProbationNextProbation *probation = [[JCModel_ProbationNextProbation alloc]init];;
        
        probation.probationIdentifier = _probationOrderList.listIdentifier;
        
        base.probation = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];

    }
    
    if (button.tag == 7)
    {
        //经销商下一步
        //下一步
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_ProbationNextBase *base = [[JCModel_ProbationNextBase alloc]init];
        
        base.command = @"stop";
        base.current = @"f_probation_send" ;
        JCModel_ProbationNextProbation *probation = [[JCModel_ProbationNextProbation alloc]init];;
        
        probation.probationIdentifier = _probationOrderList.listIdentifier;
        
        base.probation = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
        
    }
    
    if (button.tag == 8) {
        //经销商未成交
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_probation_visitBase *base = [[JCModel_probation_visitBase alloc]init];
        
        base.command = @"next";
        base.current = @"f_probation_visit" ;
        JCModel_probation_visitProbation *probation = [[JCModel_probation_visitProbation alloc]init];;
        
        probation.probationIdentifier = _probationOrderList.listIdentifier;
        probation.isDeal = @"false";
        base.probation = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
    }
    
    
    if (button.tag == 9) {
        //经销商成交
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserProbation.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_probation_visitBase *base = [[JCModel_probation_visitBase alloc]init];
        
        base.command = @"next";
        base.current = @"f_probation_visit" ;
        JCModel_probation_visitProbation *probation = [[JCModel_probation_visitProbation alloc]init];;
        
        probation.probationIdentifier = _probationOrderList.listIdentifier;
        probation.isDeal = @"true";
        base.probation = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];

    }
    
    if (button.tag == 10) {
        //未成交
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_EmpSupportProbationClinchBase *base = [[JCModel_EmpSupportProbationClinchBase alloc]init];
        
        base.command = @"stop";
        base.current = @"fgs_probation_back" ;
        JCModel_EmpSupportProbationClinchFranchiserOrder *order = [[JCModel_EmpSupportProbationClinchFranchiserOrder alloc]init];;
        
        order.franchiserOrderIdentifier = _listData.listIdentifier;
        
        base.franchiserOrder = order;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
    }
    
    if (button.tag == 11) {
        //成交
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserGrantOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_EmpSupportProbationClinchBase *base = [[JCModel_EmpSupportProbationClinchBase alloc]init];
        
        base.command = @"next";
        base.current = @"fgs_probation_back" ;
        JCModel_EmpSupportProbationClinchFranchiserOrder *order = [[JCModel_EmpSupportProbationClinchFranchiserOrder alloc]init];;
        
        order.franchiserOrderIdentifier = _listData.listIdentifier;

        base.franchiserOrder = order;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate takeProbationSuccess];
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
    
    if (_probationOrderList == nil && _listData != nil)
    {
        NSLog(@"%lu",(unsigned long)_listData.franProbation.probationCosts.count);
        return _listData.franProbation.probationCosts.count;
        
    }
    else
    {
        return _probationOrderList.probationCosts.count;
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ItemsTableViewCell1";
    ItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[ItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    if ( _listData != nil)
    {
        JCModel_EmpSupportOrderProbationCosts *probationCosts = _listData.franProbation.probationCosts[indexPath.row];
        cell.contentLabel.text = probationCosts.name;
        cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)probationCosts.num];
    }
    else
    {
        JCModel_probationOrderProbationCosts *probationCosts = _probationOrderList.probationCosts[indexPath.row];
        cell.contentLabel.text = probationCosts.name;
        cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)probationCosts.num];
    }
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 25;
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
