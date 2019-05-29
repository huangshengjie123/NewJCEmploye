//
//  MessageDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/2.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "MessageDetailsViewController.h"
#import "Macro.h"
#import "MessageDetailsTableViewCell.h"
#import "PersonDetailsTableViewCell.h"
#import "WorkGroupSeletedViewController.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
#import "JCRequest_getUserEinfo.h"

@interface MessageDetailsViewController () <UITableViewDelegate,UITableViewDataSource,NewMyGroupDelegate>

@property (nonatomic,strong) UILabel     *nameLabel;
@property (nonatomic,strong) UILabel     *phoneLabel;
@property (nonatomic,strong) UILabel     *addressLabel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSString    *mbString1;
@property (nonatomic,strong) NSString    *mbString2;

@end

@implementation MessageDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"异地客户对接";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    
    [self readNameData:[NSString stringWithFormat:@"%d",(int)_listData.from]];
    [self readNameData:[NSString stringWithFormat:@"%d",(int)_listData.to]];

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
        make.bottom.equalTo(self.view.mas_bottom).offset(-70);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 100;
    
    if (self.flag == YES)
    {
        [self addTwoButton];
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
    label.text = @"不接收";
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
    label2.text = @"选择接收员";
    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(rightButton);
        make.centerX.equalTo(rightButton);
    }];
    
}

-(void)buttonAction:(UIButton *)button {
    
    if (button.tag == 1)
    {
        WorkGroupSeletedViewController *vc = [[WorkGroupSeletedViewController alloc]init];
        vc.delegate = self;
        vc.ismMultiselect = NO;
        [self.navigationController pushViewController:vc animated:YES];
        
    }
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
        
        cell.titleLabel.text = @"客户姓名";
        cell.contentLabel.text = _listData.cusName;
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 1) {
        
        cell.titleLabel.text = @"客户电话";
        cell.contentLabel.text = _listData.cusMobile;
        cell.arrowImageView.hidden = YES;

    }
    if (indexPath.row == 2) {
        cell.titleLabel.text = @"来源公司";
        cell.contentLabel.text = _listData.fromComName;
        cell.arrowImageView.hidden = YES;

    }
    if (indexPath.row == 3) {
        
        cell.titleLabel.text = @"来源业务员";
        cell.contentLabel.text = _listData.fromName;
        cell.arrowImageView.hidden = YES;
    }
    
    if (indexPath.row == 4) {
        
        cell.titleLabel.text = @"来源业务员电话";
        cell.contentLabel.text = _mbString1;
        cell.arrowImageView.hidden = YES;

    }
    
    if (indexPath.row == 5) {
        
        cell.titleLabel.text = @"创建时间";
        cell.contentLabel.text = _listData.createTime;
        cell.arrowImageView.hidden = YES;
    }
    
    if (indexPath.row == 6) {
        
        cell.titleLabel.text = @"接收业务员";
        cell.contentLabel.text = _listData.toName;
        cell.arrowImageView.hidden = YES;
    }
    
    if (indexPath.row == 7) {
        
        cell.titleLabel.text = @"接收业务员电话";
        cell.contentLabel.text = _mbString2;
        cell.arrowImageView.hidden = YES;
        
    }

    return cell;
}
-(void)readNameData:(NSString *)string {
    
    JCRequest_getUserEinfo *request = [[JCRequest_getUserEinfo alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":string,
                                };
    
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getUserEinfo *request) {
        //
        NSLog(@"成功");
        
        NSDictionary *dic =  request.responseJSONObject;
        
        NSLog(@"%@",dic);
        
        JCModel_empInfo2Base *base = [[JCModel_empInfo2Base alloc]initWithDictionary:dic];
        
        JCModel_empInfo2Data *data  = [[JCModel_empInfo2Data alloc]init];
        data = base.data;
        
        _mbString1 = data.mbPhone;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getUserEinfo *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];

}


-(void)read2NameData:(NSString *)string {
    
    JCRequest_getUserEinfo *request = [[JCRequest_getUserEinfo alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":string,
                                };
    
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getUserEinfo *request) {
        //
        NSLog(@"成功");
        
        NSDictionary *dic =  request.responseJSONObject;
        
        NSLog(@"%@",dic);
        
        JCModel_empInfo2Base *base = [[JCModel_empInfo2Base alloc]initWithDictionary:dic];
        
        JCModel_empInfo2Data *data  = [[JCModel_empInfo2Data alloc]init];
        data = base.data;
        
        _mbString2 = data.mbPhone;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getUserEinfo *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
    
}


-(void)NewMyGroup:(JCModel_employeeInfoData *)data {
    
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@customer/updateCustomerTransRecord.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    // 请求参数字典
    JCModel_zhipancusBase *base = [[JCModel_zhipancusBase alloc]init];
    base.internalBaseClassIdentifier = _listData.listIdentifier;
    base.to = data.dataIdentifier;
  
    NSDictionary *params = base.dictionaryRepresentation;
    
    [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            [self showInfo:@"成功"];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
    } failure:^(NSError *error) {
        
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
