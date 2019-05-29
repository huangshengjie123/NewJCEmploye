//
//  Message2ViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/7.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "Message2ViewController.h"
#import "Macro.h"
#import "DataModels.h"
#import "Message2TableViewCell.h"
#import "JCRequest_readAllMessage.h"
#import "JCRequest_getUserExtInfoById.h"
#import "MessageDetailsViewController.h"

@interface Message2ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView    *tableView;
@property (nonatomic,strong) NSArray        *dataArray;
@property (nonatomic,strong) NSMutableArray *mutableArray;
@property (nonatomic,strong) UILabel        *nameLabel;

@end

@implementation Message2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"消息";
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
    
    static NSString *identifier = @"Message2TableViewCell";
    // 1.缓存中取
    Message2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[Message2TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    JCModel_newMessageList *listData = _dataArray[indexPath.row];
    cell.titleLabel.text = [JCTool xiaoxi:listData.title];
    cell.timeLabel.text = listData.sendTime;
    cell.contentLabel.text = listData.content;
    
    
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_newMessageList *listData = _dataArray[indexPath.row];
    [self readNameData:[NSString stringWithFormat:@"%d",(int)listData.formId] andType:listData.title];
}

-(void)readNameData:(NSString *)string andType:(NSString *)type{

    JCRequest_getUserExtInfoById *request = [[JCRequest_getUserExtInfoById alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":[JCTokenManager getToken],
                                @"formId":string,
                                };
    [request startWithBlockSuccess:^(__kindof JCRequest_getUserExtInfoById *request) {
       
        NSDictionary *dic =  request.responseJSONObject;
        JCModel_message2Base *base= [[JCModel_message2Base alloc]initWithDictionary:dic];
        JCModel_message2Data *data = [[JCModel_message2Data alloc]init];
        data = base.data;
        
        if (data.list.count > 0 )
        {
            JCModel_message2List *listData = data.list[0];
            MessageDetailsViewController *vc = [[MessageDetailsViewController alloc]init];
            vc.listData = listData;
            
            if ([type isEqualToString:@"nonlocal"])
            {
                vc.flag = NO;
            }
            else
            {
                vc.flag = YES;
            }
        
            [self.navigationController pushViewController:vc  animated:YES];
        }
        
    } failure:^(__kindof JCRequest_getUserExtInfoById *request, NSError *error) {
        
    }];

}

-(void)readData {
    
    JCRequest_readAllMessage *request = [[JCRequest_readAllMessage alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString *useid = [JCTokenManager getUserID];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"to":useid
                                };
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readAllMessage *request) {
        
        NSDictionary *dic =  request.responseJSONObject;
        JCModel_newMessageBase *base= [[JCModel_newMessageBase alloc]initWithDictionary:dic];
        JCModel_newMessageData *data = [[JCModel_newMessageData alloc]init];
        data = base.data;
        _dataArray = data.list;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readAllMessage *request, NSError *error) {
        
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
