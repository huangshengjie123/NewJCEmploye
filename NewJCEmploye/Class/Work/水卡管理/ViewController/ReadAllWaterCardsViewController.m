//
//  ReadAllWaterCardsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/31.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReadAllWaterCardsViewController.h"
#import "Macro.h"
#import "JCRequest_readallWaterCards.h"
#import "DataModels.h"
#import "ReadAllWaterCards2ViewController.h"
@interface ReadAllWaterCardsViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation ReadAllWaterCardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"水卡管理";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
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
        make.top.equalTo(self.view).offset(JCNew64 +10);
    }];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    JCModel_ReadWaterCard1Data *data  = _dataArray[indexPath.row];
    cell.textLabel.text = data.orgName;
    cell.textLabel.font = JCFont15;
    cell.textLabel.textColor = JCColorBlack;
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = JCColorGray;
    [cell.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.bottom.equalTo(cell.contentView);
        make.height.equalTo(@(1));
    }];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_ReadWaterCard1Data *data  = _dataArray[indexPath.row];
    ReadAllWaterCards2ViewController *vc = [[ReadAllWaterCards2ViewController alloc]init];
    vc.orgIDString =data.orgId;
    vc.isFinancial = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)readData {
    
    [HttpTool postRequestWithURLStr:getOrgByWaterCardId params:@{@"isAppLogin":@"true",@"jc4login":[JCTokenManager getToken],} success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            JCModel_ReadWaterCard1Base *base = [[JCModel_ReadWaterCard1Base alloc]initWithDictionary:responseDic];
            _dataArray = base.data;
            [_tableView reloadData];
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
    // Dispose of any resources that can be recreated
    
    
    
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
