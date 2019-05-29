//
//  InventoryWarningViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/10/29.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "InventoryWarningViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "InventoryWarningTableViewCell.h"
#import "JCRequest_readInventroyWarning1.h"
@interface InventoryWarningViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation InventoryWarningViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"库存预警";
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    [self addViews];
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
    static NSString *identifier = @"InventoryWarningTableViewCell";
    InventoryWarningTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[InventoryWarningTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
   
    JCModel_inventoryWarningPurchaserStores *listData = _dataArray[indexPath.row];
    
    cell.nameLabel.text = listData.name;
    cell.contentLabel.text = [NSString stringWithFormat:@"X  %d",(int)listData.num];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

-(void)readData {
    
    JCRequest_readInventroyWarning1 *request = [[JCRequest_readInventroyWarning1 alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readInventroyWarning1 *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =request.responseJSONObject;
        JCModel_inventoryWarningBase *base = [[JCModel_inventoryWarningBase alloc]initWithDictionary:dic];
        JCModel_inventoryWarningData *data = [[JCModel_inventoryWarningData alloc]init];
        data = base.data;
        _dataArray = data.purchaserStores;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readInventroyWarning1 *request, NSError *error) {
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
