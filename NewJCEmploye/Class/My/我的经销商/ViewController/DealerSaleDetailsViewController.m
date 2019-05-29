//
//  DealerSaleDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/9/28.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerSaleDetailsViewController.h"
#import "Macro.h"
@interface DealerSaleDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UILabel *nameLabel; //姓名
@property (nonatomic,strong) UILabel *phoneLabel; //手机
@property (nonatomic,strong) UILabel *addressLabel; //地址
@property (nonatomic,strong) UILabel *salesmanNameLabel;//业务员姓名
@property (nonatomic,strong) UILabel *stateLabel; //状态
@property (nonatomic,strong) UILabel *remakeLabel; //备注
@property (nonatomic,strong) UIView *midView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UILabel *timeLabel;//时间
@property (nonatomic,strong) UILabel *allLabel;// 商品总额
@property (nonatomic,strong) UILabel *realLabel;//实收金额
@property (nonatomic,strong) UILabel *numberLabel;//编号
@property (nonatomic,strong) UILabel *typeLabel;//客户类型
@end

@implementation DealerSaleDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"销售单详情";
    self.view.backgroundColor = JCBackgroundColor;
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
        make.height.equalTo(@(90 + 60));
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorMidGray;
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
    
    UILabel*label11 = [[UILabel alloc]init];
    label11.text = @"业务员:";
    label11.font = JCFont14;
    label11.textColor = JCColorMidGray;
    [_midView addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label2.mas_bottom).offset(7);
    }];
    
    _salesmanNameLabel = [[UILabel alloc]init];
    _salesmanNameLabel.textColor = JCColorBlack;
    _salesmanNameLabel.font = JCFont14;
    [_midView addSubview:_salesmanNameLabel];
    [_salesmanNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label11.mas_right).offset(10);
        make.centerY.equalTo(label11);
    }];
    
    UILabel *label3 = [[UILabel alloc]init];
    label3.text = @"创建时间:";
    label3.textColor = JCColorMidGray;
    label3.font = JCFont14;
    [_midView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label11.mas_bottom).offset(7);
        
    }];
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor = JCColorBlack;
    _timeLabel.font = JCFont14;
    [_midView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).offset(10);
        make.centerY.equalTo(label3);
    }];
    
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"订单编号:";
    label4.textColor = JCColorMidGray;
    label4.font = JCFont14;
    [_midView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label3.mas_bottom).offset(7);
    }];
    
    _numberLabel = [[UILabel alloc]init];
    _numberLabel.textColor = JCColorBlack;
    _numberLabel.font = JCFont14;
    [_midView addSubview:_numberLabel];
    [_numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);
        make.centerY.equalTo(label4);
    }];
    
    UILabel *label5 = [[UILabel alloc]init];
    label5.text = @"总额:";
    label5.textColor = JCColorMidGray;
    label5.font = JCFont14;
    [_midView addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label4.mas_bottom).offset(7);
    }];
    
    _allLabel = [[UILabel alloc]init];
    _allLabel.textColor = JCColorBlack;
    _allLabel.font = JCFont14;
    [_midView addSubview:_allLabel];
    [_allLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label5.mas_right).offset(10);
        make.centerY.equalTo(label5);
    }];
    
    UILabel *label6 = [[UILabel alloc]init];
    label6.text = @"实收款:";
    label6.textColor = JCColorMidGray;
    label6.font = JCFont14;
    [_midView addSubview:label6];
    [label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView).offset(10);
        make.top.equalTo(label5.mas_bottom).offset(7);
    }];
    
    _realLabel = [[UILabel alloc]init];
    _realLabel.textColor = JCColorBlack;
    _realLabel.font = JCFont14;
    [_midView addSubview:_realLabel];
    [_realLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label6.mas_right).offset(10);
        make.centerY.equalTo(label6);
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorMidGray;
    label.font = JCFont14;
    label.text = @"物品:";
    [_midView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label6.mas_bottom).offset(7);
    }];
    
    
//
    [self addTableView];
//    [self readMywarehouse];
    [self addremakeView];
    
    
 
    
    //数据填充
    
    if (_sellOrderList != nil) {
        _nameLabel.text = _sellOrderList.customer.name;
        _phoneLabel.text = _sellOrderList.customer.customerDetail.mobile;

        if (_sellOrderList.customer.customerAddressList.count > 0) {
            JCModel_CustomerCustomerAddressList *addressList = _sellOrderList.customer.customerAddressList[0];
            _addressLabel.text = addressList.address;
        }
        _stateLabel.text = [JCTool determinesSellStatusSringWith:_sellOrderList.status];
        _timeLabel.text = _sellOrderList.createTime;
        _numberLabel.text = _sellOrderList.listIdentifier;
        _allLabel.text = [NSString stringWithFormat:@"%d",(int)_sellOrderList.amount];
        _realLabel.text = [NSString stringWithFormat:@"%d",(int)_sellOrderList.getamount];;
        _salesmanNameLabel.text = _sellOrderList.guider.name;
        _typeLabel.text = _sellOrderList.type;

    }

}

-(void)addTableView {
    
    
    if (_sellOrderList != nil) {
        self.tableView = [[UITableView alloc]init];
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.backgroundColor = JCColorWithe;
        [self.view addSubview:self.tableView];
        [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.view);
            make.top.equalTo(_midView.mas_bottom);
            make.height.equalTo(@((self.sellOrderList.orderCosts.count + _sellOrderList.orderPresents.count ) * (25)));
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
    if ([_sellOrderList.comments  isEqual:@""]  || _sellOrderList.comments == nil ) {
        _remakeLabel.text = @"没有备注信息";
        _remakeLabel.textColor = JCColorMidGray;
        
    }else {
        _remakeLabel.text = _sellOrderList.comments;
        
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
