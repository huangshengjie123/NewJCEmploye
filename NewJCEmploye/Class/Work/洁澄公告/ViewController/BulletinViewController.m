//
//  BulletinViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/5/16.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "BulletinViewController.h"
#import "Macro.h"
#import "BulletinTableViewCell.h"
#import "JCRequest_ReadMyBulletin.h"
#import "DataModels.h"
#import "BaseWebViewController.h"
#import "WebViewController.h"
@interface BulletinViewController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation BulletinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"洁澄公告";
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
        make.top.equalTo(self.view).offset(JCNew64);
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
    
    static NSString *identifier = @"BulletinTableViewCell";
    BulletinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[BulletinTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_BulletinList *list = _dataArray[indexPath.row];
    cell.titleLabel.text = list.name;
    cell.contenlabel.text = list.content;
    cell.timeLabel.text = list.createTime;
    
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 88;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_BulletinList *list = _dataArray[indexPath.row];
    WebViewController *baseWebVC = [[WebViewController alloc]init];
    baseWebVC.stringID = [NSString stringWithFormat:@"%d",(int)list.listIdentifier];
    baseWebVC.nameString = list.name;
    [self.navigationController pushViewController:baseWebVC animated:YES];
}

-(void)readData {
    
    JCRequest_ReadMyBulletin *request = [[JCRequest_ReadMyBulletin alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    NSString *orgId =[JCTokenManager getUserOrgID];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"orgId":orgId,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadMyBulletin *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_BulletinBase *base = [[JCModel_BulletinBase alloc]initWithDictionary:dic];
        JCModel_BulletinData *data = base.data;
        _dataArray = data.list;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadMyBulletin *request, NSError *error) {
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
