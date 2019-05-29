//
//  WatercardDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/7/12.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WatercardDetailsViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "JCRequest_ReadWaterCardDetails.h"
#import "ItemsTableViewCell.h"
#import "MMAlertView.h"
#import "LCNetworkConfig.h"
#import "SimpleOutboundViewController.h"
@interface WatercardDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UILabel *nameLabel;
@property (nonatomic,strong) UILabel *phoneLabel;
@property (nonatomic,strong) UILabel *adressLabel;
@property (nonatomic,strong) UILabel *numLabel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) UIView *midView;
@property (nonatomic,strong) JCModel_WaterCardDetailsData *data;
@property (nonatomic,strong) NSString *validationString;
@end

@implementation WatercardDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"水卡详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
   
    
    if (_base.data.count > 0) {
        JCModel_WaterCardDetailsData *data = _base.data[0];
        _data = data;
    }
    
    
    
    UIView *topView = [[UIView alloc]init];
    [self.view addSubview:topView];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(JCNew64 + 10);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(60));
    }];
    
    
    UILabel *nameLabel = [[UILabel alloc]init];
    nameLabel.font = JCFont14;
    nameLabel.textColor = JCColorBlack;
    [topView addSubview:nameLabel];
    [nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).offset(10);
        make.top.equalTo(topView.mas_top).offset(10);
    }];
    _nameLabel = nameLabel;
    _nameLabel.text = _data.username;
    UILabel *phoneLabel = [[UILabel alloc]init];
    phoneLabel.font = JCFont15;
    phoneLabel.textColor = JCColorBlack;
    [topView addSubview:phoneLabel];
    [phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(topView).offset(-10);
        make.centerY.equalTo(nameLabel);
    }];
    _phoneLabel = phoneLabel;
    
    if (_data.mbPhone.length > 4) {
        
        _validationString = [_data.mbPhone substringFromIndex:_data.mbPhone.length - 4];
        
        _phoneLabel.text = [NSString stringWithFormat:@"%@****", [_data.mbPhone substringToIndex:_data.mbPhone.length - 4]];

    }else {
        _phoneLabel.text = @"联系电话信息有误";
        _phoneLabel.textColor = JCColorMidGray;
    }
    
    NSLog(@">>>>>>>>>>>>>>>>>>>>>>>>>%@",_validationString);
    
  
    UILabel *addressLabel = [[UILabel alloc]init];
    addressLabel.font = JCFont15;
    addressLabel.textColor = JCColorBlack;
    [topView addSubview:addressLabel];
    [addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView.mas_left).offset(10);
        make.right.equalTo(topView.mas_right).offset(-10);
        make.top.equalTo(phoneLabel.mas_bottom).offset(7);
    }];
    _adressLabel = addressLabel;
    
    if (_data.customerAddresses.count > 0) {
        JCModel_WaterCardDetailsCustomerAddresses *customerAddress = _data.customerAddresses[0];
        _adressLabel.text = [NSString stringWithFormat:@"%@%@",customerAddress.xpath,customerAddress.address];

    }
    
    UIView *midView = [[UIView alloc]init];
    midView.backgroundColor = JCColorWithe;
    [self.view addSubview:midView];
    [midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.top.equalTo(topView.mas_bottom).offset(10);
        make.right.equalTo(self.view);
        make.height.equalTo(@(30));
    }];
    _midView = midView;
    
    UILabel *lable = [[UILabel alloc]init];
    lable.text = @"卡号:";
    lable.textColor = JCColorBlack;
    lable.font = JCFont15;
    [midView addSubview:lable];
    [lable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(midView.mas_left).offset(10);
        make.centerY.equalTo(midView);
    }];
    
    _numLabel = [[UILabel alloc]init];
    _numLabel.textColor = JCColorBlack;
    _numLabel.font = JCFont15 ;
    [midView addSubview:_numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lable.mas_right).offset(5);
        make.centerY.equalTo(midView);
    }];
    
    _numLabel.text = [NSString stringWithFormat:@"%@",_data.dataIdentifier];
    
    
    UIButton *button = [[UIButton alloc]init];
    button.backgroundColor = JCColorBlue;
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.equalTo(@(40));
        make.bottom.equalTo(self.view).offset(-20);
    }];
    [button addTarget:self action:@selector(buttonACtion) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"消费";
    label.textColor = JCColorWithe;
    [button addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button);
    }];
    
    if (_data.waterCardItems.count >0) {
        [self addTableView];
    }
    
}

-(void)buttonACtion {
    
    if ([_phoneLabel.text  isEqual: @"联系电话信息有误"]) {
        [self showInfo:@"联系电话有误，请修改"];
        return ;
    }
    
    
    MMAlertView *view = [[MMAlertView alloc]initWithInputTitle:@"输入手机号码后4位" detail:@"" placeholder:@"" handler:^(NSString *text) {
        
        

        if (_validationString == text) {
            // 密码正确 可以消费
            SimpleOutboundViewController *simpleOoutboundVC = [[SimpleOutboundViewController alloc]init];
            simpleOoutboundVC.tpyeString = @"2";
            simpleOoutboundVC.waterCardId = _waterCardID;
            simpleOoutboundVC.userID2 = _data.owner;
            [self.navigationController pushViewController:simpleOoutboundVC animated:YES];
    
            
        }else {
            //输入错误置空
            [self showInfo:@"信息不对,重新输入"];

        }


    }];

    [view show];

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
        make.height.equalTo(@(_data.waterCardItems.count * (25)));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.userInteractionEnabled = NO;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.waterCardItems.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ItemsTableViewCell2";
    // 1.缓存中取
    ItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_WaterCardDetailsWaterCardItems *probationCosts = _data.waterCardItems[indexPath.row];
    
    
    cell.contentLabel.text = probationCosts.itemName;
    cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)probationCosts.num];
    
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
