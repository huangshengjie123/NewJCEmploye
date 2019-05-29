//
//  DealerAccountViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/9.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "DealerAccountViewController.h"
#import "Macro.h"
#import "DealerAccountTableViewCell.h"
#import "JCRequest_readMyFinfo.h"
#import "DataModels.h"
#import "JCRequest_searchFranchiserRecordWithPage1.h"
@interface DealerAccountViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UILabel *accountLabel;
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation DealerAccountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"我的账户";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readMyInfo];
    [self readData];
}

-(void)addViews {
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(JCNew64 +10);
        make.height.equalTo(@(100));
    }];
    
    _accountLabel = [[UILabel alloc]init];
    _accountLabel.textColor = JCColorBlue;
    _accountLabel.font = [UIFont boldSystemFontOfSize:20];
    [topView addSubview:_accountLabel];
    [_accountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(topView);
    }];
    
    
    _tableView = [[UITableView alloc]init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = JCBackgroundColor;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(10);
        make.bottom.equalTo(self.view);
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"DealerAccountTableViewCell";
    DealerAccountTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[DealerAccountTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    JCModel_RecordsConsumptionList *list = _dataArray[indexPath.row];
    
    cell.amountLabel.text = [NSString stringWithFormat:@"%d",(int)list.amount];
 
    if ([list.type  isEqual:@"1"]) {
        cell.typeLabel.text = @"消费";
        cell.typeLabel.textColor = JCColorBlue;
    }
    if ([list.type  isEqual:@"0"]) {
        cell.typeLabel.text = @"充值";
        cell.typeLabel.textColor = [UIColor orangeColor];

    }
    
    if ([list.type  isEqual:@"2"]) {
        cell.typeLabel.text = @"提现";
        cell.typeLabel.textColor = [UIColor orangeColor];
        
    }
    
    if ([list.type  isEqual:@"3"]) {
        cell.typeLabel.text = @"提现额充入";
        cell.typeLabel.textColor = [UIColor orangeColor];
        
    }
    
    if ([list.type  isEqual:@"4"]) {
        cell.typeLabel.text = @"余额减少";
        cell.typeLabel.textColor = [UIColor orangeColor];
        
    }
    
    cell.timeLabel.text = list.time;
    
    NSString *str =@"";
    if (list.items.count >0) {
        
        for (int i = 0; i < list.items.count; i ++) {
            JCModel_RecordsConsumptionItems *item = list.items[i];
            
            str = [NSString stringWithFormat:@"%@ %@ x %d",str,item.name,(int)item.num];
            
        }
        

    }
    cell.itemLabel.text = str;

    
    
    return cell;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

-(void)readMyInfo {
    JCRequest_readMyFinfo *request = [[JCRequest_readMyFinfo alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *uid = [JCTokenManager getUserID];
    
    
    if (_guideSring != nil) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id":_guideSring,
                                    };
    }else{
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id":uid
                                    };
        
    }
    
   
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readMyFinfo *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
         NSLog(@"%@",dic);
        
        
        
        JCModel_FinfoBase *base = [[JCModel_FinfoBase alloc]initWithDictionary:dic];
        JCModel_FinfoData *data = [[JCModel_FinfoData alloc]init];
        data = base.data;
        _accountLabel.text = [NSString stringWithFormat: @"￥%d",(int)data.balance];
      
    } failure:^(__kindof JCRequest_readMyFinfo *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(void)readData {
    JCRequest_searchFranchiserRecordWithPage1 *request = [[JCRequest_searchFranchiserRecordWithPage1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    NSString *uid = [JCTokenManager getUserID];

    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"franchiser":uid
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_searchFranchiserRecordWithPage1 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_RecordsConsumptionBase *base = [[JCModel_RecordsConsumptionBase alloc]initWithDictionary:dic];
        JCModel_RecordsConsumptionData *data = [[JCModel_RecordsConsumptionData alloc]init];
        data = base.data;
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_searchFranchiserRecordWithPage1 *request, NSError *error) {
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
