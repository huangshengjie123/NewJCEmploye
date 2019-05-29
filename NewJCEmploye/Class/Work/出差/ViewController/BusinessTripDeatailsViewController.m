//
//  BusinessTripDeatailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/3/20.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "BusinessTripDeatailsViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "DataModels.h"
#import "JCRequest_cancelbusinessTrip.h"
#import "JCRequest_completedBusinessTrip.h"


@interface BusinessTripDeatailsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView      *tableView;


@end

@implementation BusinessTripDeatailsViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"报销详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    if ([_typeString  isEqual: @"管理"])
    {
        if ([_listData.status isEqual:Financial_create])
        {
            [self addTwoButton];
        }
    }
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).offset(0);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-80);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}
-(void)addTwoButton{
    
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    UIButton *leftbutton = [[UIButton alloc]init];
    leftbutton.backgroundColor = JCColorBlue;
    [self.view addSubview:leftbutton];
    [leftbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-30);
        make.height.equalTo(@(40));
    }];
    leftbutton.tag = 0;
    [leftbutton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"驳回";
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
    
    if (button.tag == 0)
    {
        //取消
        JCRequest_cancelbusinessTrip *request = [[JCRequest_cancelbusinessTrip alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"businessTripId":_listData.listIdentifier
                                    };
        [request startWithBlockSuccess:^(__kindof JCRequest_cancelbusinessTrip *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            NSString *result = [dic objectForKey:@"result"];
            NSString *msg = [dic objectForKey:@"msg"];
            
            if ([result  isEqual: @"success"])
            {
                [self showInfo:@"取消成功"];
                [self.delegate detailsActionSuccessDelegate];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:msg];
            }
    
        } failure:^(__kindof JCRequest_cancelbusinessTrip *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    }
    
    if (button.tag == 1)
    {
        //通过
        JCRequest_completedBusinessTrip *request = [[JCRequest_completedBusinessTrip alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"businessTripId":_listData.listIdentifier
                                    };
        
        
        [request startWithBlockSuccess:^(__kindof JCRequest_completedBusinessTrip *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            NSString *result = [dic objectForKey:@"result"];
            NSString *msg = [dic objectForKey:@"msg"];
            
            if ([result  isEqual: @"success"]) {
                [self showInfo:@"通过成功"];
                [self.delegate detailsActionSuccessDelegate];
                [self.navigationController popViewControllerAnimated:YES];
            }else {
                [self showInfo:msg];
            }
            
            NSLog(@"%@",dic);
            
            
        } failure:^(__kindof JCRequest_completedBusinessTrip *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
    }

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  9;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"PersonDetailsTableViewCell";
    PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil)
    {
        cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    if (indexPath.row == 0)
    {
        cell.titleLabel.text = @"申请人";
        cell.contentLabel.text = _listData.apprInfo.name;
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 1)
    {
        cell.titleLabel.text = @"申请人手机号";
        cell.contentLabel.text = _listData.apprInfo.mbPhone;
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 2)
    {
        cell.titleLabel.text = @"申请状态";
        cell.contentLabel.text = [JCTool chucha:_listData.status];
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 3)
    {
        cell.titleLabel.text = @"申请时间";
        cell.contentLabel.text = _listData.time;
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 4)
    {
        cell.titleLabel.text = @"出差单号";
        cell.contentLabel.text = _listData.listIdentifier;
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 5)
    {
        cell.titleLabel.text = @"行程";
        cell.contentLabel.text = [NSString stringWithFormat:@"%@ - %@",_listData.from,_listData.to];
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 6)
    {
        cell.titleLabel.text = @"出差事由";
        cell.contentLabel.text = _listData.status;
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 7)
    {
        cell.titleLabel.text = @"主管";
        cell.contentLabel.text = _listData.leaderInfo.name;
        cell.arrowImageView.hidden = YES;
    }
    if (indexPath.row == 8)
    {
        cell.titleLabel.text = @"备注";
        cell.contentLabel.text = _listData.comment;
        cell.arrowImageView.hidden = YES;
    }
    
    return cell;
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
