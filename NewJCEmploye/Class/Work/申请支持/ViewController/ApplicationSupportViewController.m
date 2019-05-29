//
//  ApplicationSupportViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/12/21.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "ApplicationSupportViewController.h"
#import "Macro.h"
#import "ApplicationSupportTableViewCell.h"
#import "CrateApplicationSupportViewController.h"
#import "Request_searchMyFranchiserGrantOrders.h"
#import "DataModels.h"

@interface ApplicationSupportViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;
@end

@implementation ApplicationSupportViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"申请支持";
    self.view.backgroundColor = JCBackgroundColor;
    [self readData];
    UIButton *informationCardBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [informationCardBtn addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [informationCardBtn setImage:[UIImage imageNamed:@"加号"] forState:UIControlStateNormal];
    
    [informationCardBtn sizeToFit];
    UIBarButtonItem *informationCardItem = [[UIBarButtonItem alloc] initWithCustomView:informationCardBtn];
    
    self.navigationItem.rightBarButtonItems  = @[informationCardItem];
    [self addViews];
}

-(void)buttonAction {
    CrateApplicationSupportViewController *vc = [[CrateApplicationSupportViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
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
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ApplicationSupportTableViewCell";
    // 1.缓存中取
    ApplicationSupportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[ApplicationSupportTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    
    
    JCModel_MyFranchiserGrantOrdersList *listData = _dataArray[indexPath.row];
    cell.stastLabel.text = [JCTool applicationSupport:listData.status];
    cell.timeLabel.text = [NSString stringWithFormat:@"时间: %@",listData.createTime];

      if (listData.customerPrepare.name == NULL) {
          
          JCModel_MyFranchiserGrantOrdersCustomer *custome = listData.customer;
          
        

          cell.nameLabel.text = custome.name;
          cell.phoneLabel.text = custome.customerDetail.mobile;
          
          if (listData.customer.customerAddressList.count > 0) {
              
              JCModel_MyFranchiserGrantOrdersCustomerAddressList *addressList = listData.customer.customerAddressList[0];
              cell.addressLabel.text = [NSString stringWithFormat:@"地址:%@%@",addressList.xpath,addressList.address];

          }
          
      }else {
          cell.nameLabel.text = listData.customerPrepare.name;
          cell.phoneLabel.text = listData.customerPrepare.phone;
          cell.addressLabel.text = [NSString stringWithFormat:@"地址:%@%@",listData.customerPrepare.xpath,listData.customerPrepare.address];

      }
    

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 94;
}

-(void)readData {
    
    Request_searchMyFranchiserGrantOrders *request = [[Request_searchMyFranchiserGrantOrders alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *userid = [JCTokenManager getUserID];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    NSLog(@"%@",userid);
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                @"jc4login":token
                                };
    
    
    [request startWithBlockSuccess:^(__kindof Request_searchMyFranchiserGrantOrders *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
         NSLog(@"%@",dic);
        JCModel_MyFranchiserGrantOrdersBase *base= [[JCModel_MyFranchiserGrantOrdersBase alloc]initWithDictionary:dic];
        
        JCModel_MyFranchiserGrantOrdersData *data = [[JCModel_MyFranchiserGrantOrdersData alloc]init];
        data = base.data;
        _dataArray = data.list;
        
        [self.tableView reloadData];
        
    } failure:^(__kindof Request_searchMyFranchiserGrantOrders *request, NSError *error) {
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
