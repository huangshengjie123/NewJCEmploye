//
//  WatercardRecordsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WatercardRecordsViewController.h"
#import "Macro.h"
#import "WatercardRecordsTableViewCell.h"
#import "JCRequest_getWaterCardRecordsByParams1.h"
#import "DataModels.h"
@interface WatercardRecordsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation WatercardRecordsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"水卡记录";
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
    static NSString *identifier = @"WatercardRecordsTableViewCell";
    // 1.缓存中取
    WatercardRecordsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[WatercardRecordsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    JCModel_watercardRecordsList *listData = _dataArray[indexPath.row];
    
    cell.typeLabel.text = [JCTool watercardRecord:listData.reason];
    cell.timeLabel.text = listData.createTime;
    cell.itemsLabel.text =[NSString stringWithFormat:@"%@ x %d",listData.name,(int)listData.num];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 78;
}


-(void)readData {
    
    JCRequest_getWaterCardRecordsByParams1 *request = [[JCRequest_getWaterCardRecordsByParams1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
 
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"pageNum" :pageNum,
                                @"pageSize":pageSize,
                                @"id":_idString,
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getWaterCardRecordsByParams1 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_watercardRecordsBase *base = [[JCModel_watercardRecordsBase alloc]initWithDictionary:dic];
        JCModel_watercardRecordsData *data = [[JCModel_watercardRecordsData alloc]init];
        data = base.data;
        _dataArray = data.list;
        
        [_tableView reloadData];
        NSLog(@"dic%@",dic);
        
    } failure:^(__kindof JCRequest_getWaterCardRecordsByParams1 *request, NSError *error) {
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
