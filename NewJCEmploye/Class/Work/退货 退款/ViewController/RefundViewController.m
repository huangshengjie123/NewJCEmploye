//
//  RefundViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/30.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "RefundViewController.h"
#import "Macro.h"
#import "ReturnGoodsTableViewCell.h"
#import "JCRequest_getRefundmentsByPageSearch.h"
#import "DataModels.h"
#import "JCTool.h"
#import "JCRequest_readRefundData.h"
#import "RefundDetailsViewController.h"
@interface RefundViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation RefundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"退款清单";
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
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.estimatedRowHeight = 100;

    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ReturnGoodsTableViewCell";
    // 1.缓存中取
    ReturnGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ReturnGoodsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_refundData3List *listData = _dataArray[indexPath.row];
    
    cell.nameLabel.text = listData.customer.name;
    cell.timeLabel.text =listData.createTime;
    cell.statusLabel.text = [JCTool tuihuo:listData.status];
    cell.numLabel.text = [NSString stringWithFormat:@"%d",(int)listData.getamount];
      return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    JCModel_refundData3List *listData = _dataArray[indexPath.row];
    RefundDetailsViewController *vc = [[RefundDetailsViewController alloc]init];
    vc.listData = listData;
    [self.navigationController pushViewController:vc animated:YES];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return  80;
    
}

-(void)readData {
    JCRequest_readRefundData *request = [[JCRequest_readRefundData alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readRefundData *request) {
        //
        NSLog(@"成功");
        
        NSDictionary *dic =  request.responseJSONObject;
        
        JCModel_refundData3Base *base = [[JCModel_refundData3Base alloc]initWithDictionary:dic];
        
        JCModel_refundData3Data *data = [[JCModel_refundData3Data alloc]init];
        data = base.data;
        
        _dataArray = data.list;
        
        [_tableView reloadData];
        
        
        
    } failure:^(__kindof JCRequest_readRefundData *request, NSError *error) {
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
