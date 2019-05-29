//
//  NewDistributionDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/24.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "NewDistributionDetailsViewController.h"
#import "Macro.h"
#import "JCRequest_getDistributionDetailById1.h"
#import "DataModels.h"
#import "ItemsTableViewCell.h"
#import "JCTool.h"
#import "LCNetworkConfig.h"
#import "SGActionView.h"
@interface NewDistributionDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UILabel *nameLabel; //姓名
@property (nonatomic,strong) UILabel *phoneLabel; //手机
@property (nonatomic,strong) UILabel *addressLabel; //地址
@property (nonatomic,strong) UILabel *stateLabel; //状态
@property (nonatomic,strong) UILabel *numLabel;// 编号
@property (nonatomic,strong) UILabel *timeLabel;// 时间
@property (nonatomic,strong) UILabel *carLabel;//车辆
@property (nonatomic,strong) UIButton *changeCarButton;//修改车辆

@property (nonatomic,strong) UILabel *remakeLabel; //备注
@property (nonatomic,strong) UIView *midView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) JCModel_NewDistributionCarDetailsData *data;
@end

@implementation NewDistributionDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"配送详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
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
    
    //数据填充
    _nameLabel.text = _data.customer.name;
    _phoneLabel.text = _data.customer.customerDetail.mobile;
    if (_data.customer.customerAddressList.count > 0) {
        JCModel_NewDistributionCarDetailsCustomerAddressList *listData = _data.customer.customerAddressList[0];
            _addressLabel.text = listData.address;
    }
    
    _midView = [[UIView alloc]init];
    _midView.backgroundColor = JCColorWithe;
    [self.view addSubview:_midView];
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(5);
        make.height.equalTo(@(110));
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorBlack;
    label2.font = JCFont15;
    label2.text = @"状态:";
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView.mas_left).offset(10);
        make.top.equalTo(_midView.mas_top).offset(10);
    }];
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.textColor = JCColorWithe;
    _stateLabel.backgroundColor = JCColorMidGray;
    _stateLabel.font = [UIFont boldSystemFontOfSize:12];
    _stateLabel.text = [JCTool newDistributionDetails:_data.status];
    [_midView addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];
    _stateLabel.layer.masksToBounds = YES;
    _stateLabel.layer.cornerRadius = 2;

    UILabel *label3 = [[UILabel alloc]init];
    label3.textColor = JCColorBlack;
    label3.font = JCFont14;
    label3.text = @"订单编号:";
    [_midView addSubview:label3];
    [label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label2.mas_bottom).offset(8);
    }];

    _numLabel = [[UILabel alloc]init];
    _numLabel.textColor =JCColorBlack;
    _numLabel.font = JCFont15;
    [_midView addSubview:_numLabel];
    [_numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3.mas_right).offset(10);
        make.centerY.equalTo(label3);
    }];
    _numLabel.text = _data.dataIdentifier;

    UILabel *label4 = [[UILabel alloc]init];
    label4.textColor = JCColorBlack;
    label4.font = JCFont15;
    label4.text = @"时间:";
    [_midView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label3.mas_bottom).offset(8);
    }];

    _timeLabel = [[UILabel alloc]init];
    _timeLabel.textColor =JCColorBlack;
    _timeLabel.font = JCFont15;
    [_midView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);
        make.centerY.equalTo(label4);
    }];
    _timeLabel.text = _data.createTime;

    UILabel *label5 = [[UILabel alloc]init];
    label5.textColor = JCColorBlack;
    label5.font = JCFont15;
    label5.text = @"配送车辆:";
    [_midView addSubview:label5];
    [label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label4.mas_bottom).offset(8);
    }];

    _carLabel = [[UILabel alloc]init];
    _carLabel.textColor =JCColorBlack;
    _carLabel.font = JCFont15;
    [_midView addSubview:_carLabel];
    [_carLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label5.mas_right).offset(10);
        make.centerY.equalTo(label5);
    }];
    _carLabel.text = _data.cars.plate;

    UILabel *label = [[UILabel alloc]init];
    label.textColor = JCColorBlack;
    label.font = JCFont14;
    label.text = @"物品:";
    [_midView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label5.mas_bottom).offset(7);
    }];

    
    
    _dataArray = @[@"酸枝木饮水机",@"吉善泉带装水",@"椎管"];
    
    [self addTableView];
    
    [self addremakeView];
    
    //配送中 生成2个按钮呢
    if ([_data.status  isEqual: @"distribution_on_road"]) {
        [self addButton];
    }
    
}

-(void)addButton {
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"配送取消";
    label1.textColor = JCColorWithe;
    [button1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    button1.tag  = 1;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button2.tag  = 2;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"完成配送";
    label2.textColor = JCColorWithe;
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button2);
    }];
    
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
    
}

-(void)buttonAction:(UIButton *)button {
    if (button.tag == 1) {
        //取消配送操作
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@distribution/dealDistribution.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_doDistributionUPBase *base = [[JCModel_doDistributionUPBase alloc]init];
        
        base.command = @"next";
        base.current = @"distribution_on_road" ;
        base.isComplete = @"stop";
        JCModel_doDistributionUPDistribution *data = [[JCModel_doDistributionUPDistribution alloc]init];;
        
        data.distributionIdentifier = _idString;
        
        
        base.distribution = data;
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
                
                if ([result isEqualToString:@"success"]) {
                    //下一步成功  刷新出 成交 和未成交 按钮
                    
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =@"操作失败";
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
    }
    
    
    if (button.tag == 2) {
        
        
        
        NSArray *array = @[@"是",@"否"];
        
        //设置选择框  -1 是为了什么都不选
        [SGActionView showSheetWithTitle:@"是否确定配送" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            if (index == 0) {
                
                        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                        NSString *token = [JCTokenManager getToken];
                        NSString *accessPath = [NSString stringWithFormat:@"%@distribution/dealDistribution.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                
                
                        // 请求参数字典
                        JCModel_doDistributionUPBase *base = [[JCModel_doDistributionUPBase alloc]init];
                
                        base.command = @"next";
                        base.current = @"distribution_on_road" ;
                        base.isComplete = @"completed";
                        JCModel_doDistributionUPDistribution *data = [[JCModel_doDistributionUPDistribution alloc]init];;
                
                        data.distributionIdentifier = _idString;
                        data.items = _data.items;

                        base.distribution = data;
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
                                    //下一步成功  刷新出 成交 和未成交 按钮
                
                                    [self.navigationController popViewControllerAnimated:YES];
                
                                }else {
                                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                                    [self.view addSubview:hud];
                                    hud.label.text =msg;
                                    hud.mode = MBProgressHUDModeText;
                                    [hud showAnimated:YES];
                                    [hud hideAnimated:YES afterDelay:1];
                
                                }
                            } else {
                                NSLog(@"请求失败error=%@", error);
                            }
                        }];
                
                        [task resume];
            }
            
            
        }];
        
        
        
//
        
    }
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
        make.height.equalTo(@(_data.items.count * (25)));
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
    if ([_data.comment  isEqual:@""] || _data.comment == nil) {
        _remakeLabel.text = @"没有备注信息";
        _remakeLabel.textColor = JCColorMidGray;

    }else {
        _remakeLabel.text = _data.comment;

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
-(void)readData {
    
    JCRequest_getDistributionDetailById1 *request = [[JCRequest_getDistributionDetailById1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":_idString
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getDistributionDetailById1 *request) {
        //
        NSLog(@"成功");
        NSDictionary * dic = request.responseJSONObject;
        JCModel_NewDistributionCarDetailsBase *base = [[JCModel_NewDistributionCarDetailsBase alloc]initWithDictionary:dic];
        
        _data = [[JCModel_NewDistributionCarDetailsData alloc]init];
        
        _data = base.data;
        
        [self addViews];
        
    } failure:^(__kindof JCRequest_getDistributionDetailById1 *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.items.count;
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

    JCModel_NewDistributionCarDetailsItems *probationCosts = _data.items[indexPath.row];


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
