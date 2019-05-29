//
//  CooperationDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/13.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "CooperationDetailsViewController.h"
#import "Macro.h"
#import "CommonView.h"
#import "ItemsTableViewCell.h"
@interface CooperationDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UILabel *contractTimeLabel; //合同 时间
@property (nonatomic,strong) CommonView *nameLabelView;//姓名
@property (nonatomic,strong) CommonView *phoneLabelView; // 电话
@property (nonatomic,strong) CommonView *storeNameLabelView; //店名
@property (nonatomic,strong) CommonView *startTimeLabelView; //开始时间
@property (nonatomic,strong) CommonView *probationNumLabelView; //试用人数
@property (nonatomic,strong) UILabel *addressLabel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UILabel *remakeLabel; //备注


@end

@implementation CooperationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"合作点详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 + 5);
        make.height.equalTo(@(44));
    }];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"合同日期:";
    label.textColor = JCColorBlack;
    label.font = JCFont14;
    [topView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).offset(10);
        make.centerY.equalTo(topView);
    }];
    
    _contractTimeLabel = [[UILabel alloc]init];
    _contractTimeLabel.textColor = JCColorBlack;
    _contractTimeLabel.font = JCFont14;
    _contractTimeLabel.text = @"2018.02.24 - 2018.03.24";
    [topView addSubview:_contractTimeLabel];
    [_contractTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label.mas_right).offset(5);
        make.centerY.equalTo(label);
    }];
    
    _nameLabelView = [[CommonView alloc]init];
    _nameLabelView.titleLabel.text = @"联系人:";
    _nameLabelView.contentLabel.text = @"陈升琪";
    [self.view addSubview:_nameLabelView];
    [_nameLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).offset(5);
        make.left.right.equalTo(topView);
        make.height.equalTo(@(44));
    }];
    
    _phoneLabelView = [[CommonView alloc]init];
    _phoneLabelView.titleLabel.text = @"电话:";
    _phoneLabelView.contentLabel.text = @"18922385034";
    [self.view addSubview:_phoneLabelView];
    [_phoneLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_nameLabelView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    
    _storeNameLabelView = [[CommonView alloc]init];
    _storeNameLabelView.titleLabel.text = @"合作点名:";
    _storeNameLabelView.contentLabel.text = @"无锡茶社";
    [self.view addSubview:_storeNameLabelView];
    [_storeNameLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_phoneLabelView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    
    _startTimeLabelView = [[CommonView alloc]init];
    _startTimeLabelView.titleLabel.text = @"创建时间:";
    _startTimeLabelView.contentLabel.text = @"2018.02.24";
    [self.view addSubview:_startTimeLabelView];
    [_startTimeLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_storeNameLabelView.mas_bottom).offset(1);
        make.height.equalTo(@(44));
    }];
    
    _dataArray = @[@"酸枝木饮水机",@"吉善泉带装水",@"椎管"];

    
    [self addAddressView];
    
    [self addTableView];
    
    [self addremakeView];
    
}

-(void)addAddressView {
    
    UIView *addressView = [[UIView alloc]init];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"地址:";
    label2.textColor = JCColorBlack;
    label2.font = JCFont14;
    [addressView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(addressView).offset(10);
        make.top.equalTo(addressView).offset(10);
    }];
    
    _addressLabel = [[UILabel alloc]init];
    _addressLabel.numberOfLines = 0;
    _addressLabel.textColor = JCColorBlack;
    _addressLabel.font = JCFont14;
    [addressView addSubview:_addressLabel];
    [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(addressView).offset(-10);
        make.left.equalTo(addressView).offset(48);
        make.top.equalTo(label2);
    }];
    _addressLabel.text = @"无锡市金石路545号大大大开始打开了的考拉上考虑尽快尽快卡了大量空间来看阿里实际上计算机";
    
    addressView.backgroundColor = JCColorWithe;
    [self.view addSubview:addressView];
    [addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_startTimeLabelView.mas_bottom).offset(1);
        make.bottom.equalTo(_addressLabel.mas_bottom).offset(10);
    }];
    
}

-(void)addTableView {
    
    CommonView *view1 = [[CommonView alloc]init];
    view1.titleLabel.text = @"物品:";
    [self.view addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_addressLabel.mas_bottom).offset(11);
        make.height.equalTo(@(36));
        
    }];
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCColorWithe;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(view1.mas_bottom);
        make.height.equalTo(@(self.dataArray.count * (25)));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.userInteractionEnabled = NO;
    
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
    _remakeLabel.text = @"打瞌睡了大量开始建档立卡解释道可垃圾了深刻的记录卡所经历的看见爱上了肯德基卢卡斯建档立卡教室里看到";
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ItemsTableViewCell1";
    // 1.缓存中取
    ItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    cell.contentLabel.text = _dataArray[indexPath.row];
    cell.numberLabel.text = @" x 1";
    
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
