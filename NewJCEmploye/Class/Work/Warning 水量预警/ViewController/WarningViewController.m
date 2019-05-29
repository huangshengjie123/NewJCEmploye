//
//  WarningViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/27.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "WarningViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "WarningTableViewCell.h"
#import "JCRequest_ReadWarning.h"
#import "DataModels.h"
@interface WarningViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation WarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
    self.title = @"客户水量预警";
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
        make.top.equalTo(self.view).offset(JCNew64 + 10);
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
    static NSString *identifier = @"WarningTableViewCell";
    WarningTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[WarningTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    JCModel_ReadWarningList *listData =  _dataArray[indexPath.row];
    
    cell.nameLabel.text = listData.name;
    cell.phoneLabel.text = listData.mobile;
    cell.addressLabel.text = listData.address;
    cell.cardNumLabel.text = listData.listIdentifier;
    cell.waterNumLabel.text = [NSString stringWithFormat:@"剩余 %d 袋",(int)listData.total];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//读取
-(void)readData {
    
    JCRequest_ReadWarning *request = [[JCRequest_ReadWarning alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    if (_guideSring != nil) {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":_guideSring,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    };
        
    }else {
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"guide":[JCTokenManager getUserID],
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    };
        
    }
    
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadWarning *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        NSLog(@"%@",dic);
        JCModel_ReadWarningBase *base = [[JCModel_ReadWarningBase alloc]initWithDictionary:dic];
        JCModel_ReadWarningData *data = [[JCModel_ReadWarningData alloc]init];
        data = base.data;
        _dataArray = data.list;
        
        [_tableView reloadData];
        
        
    } failure:^(__kindof JCRequest_ReadWarning *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
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
