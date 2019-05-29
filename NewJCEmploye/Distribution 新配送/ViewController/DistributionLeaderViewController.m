
//
//  DistributionLeaderViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/17.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DistributionLeaderViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "DistributionLeaderTableViewCell.h"
#import "NewDistributionViewController.h"
#import "JCRequest_getCarsByCom.h"
#import "SelectedPForCarViewController.h"
@interface DistributionLeaderViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation DistributionLeaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"绑定配送员";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 +10);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"DistributionLeaderTableViewCell";
    // 1.缓存中取
    DistributionLeaderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[DistributionLeaderTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_CarData *data = _dataArray[indexPath.row];
    cell.carNameLabel.text = data.plate;
    cell.contentLabel.text = data.name;
    
    [cell.selectButton  addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    
//    cell.selectButton.backgroundColor = [UIColor redColor];
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 50;
    
}



-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_CarData *data = _dataArray[indexPath.row];
    NewDistributionViewController *vc = [[NewDistributionViewController alloc]init];
    vc.carId = [NSString stringWithFormat:@"%d",(int)data.dataIdentifier];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)buttonAction {
    
    SelectedPForCarViewController *vc = [[SelectedPForCarViewController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
    
}

//查询车辆
-(void)readData {
    
    JCRequest_getCarsByCom *request = [[JCRequest_getCarsByCom alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getCarsByCom *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_CarBase *base= [[JCModel_CarBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getCarsByCom *request, NSError *error) {
        NSLog(@"失败 %@",error);
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
