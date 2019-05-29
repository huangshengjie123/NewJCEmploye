//
//  ReturnGoodsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/24.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "ReturnGoodsViewController.h"
#import "Macro.h"
#import "ReturnGoodsTableViewCell.h"
#import "JCRequest_getRefundmentsByPageSearch.h"
#import "DataModels.h"
#import "JCTool.h"
#import "SGActionView.h"
#import "JCRequest_deletetuihuoorder.h"
#import "LCNetworkConfig.h"

@interface ReturnGoodsViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;

@end

@implementation ReturnGoodsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.title = @"退货清单";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
    [self readData];
}

-(void)addViews {
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ReturnGoodsTableViewCell";
    // 1.缓存中取
    ReturnGoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil)
    {
        cell = [[ReturnGoodsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_salesReturnList *listData = _dataArray[indexPath.row];
    
    cell.nameLabel.text = listData.customer.name;
    cell.timeLabel.text =listData.createTime;
    cell.statusLabel.text = [JCTool tuihuo:listData.status];
    cell.numLabel.text = [NSString stringWithFormat:@"%d",(int)listData.getamount];

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_salesReturnList *listData = _dataArray[indexPath.row];
    if ([listData.status  isEqual: @"refundment_confirm"])
    {
        
        NSArray *array = @[@"确认删除",@"取消删除"];
        
        [SGActionView showSheetWithTitle:@"是否删除空单" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            
            if (index == 0) {
                
                LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
                NSString *token = [JCTokenManager getToken];
                NSString *accessPath = [NSString stringWithFormat:@"%@refundment/deleteRefundmentOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
                
                // 请求参数字典
                JCModel_deletetuihuoBase *base = [[JCModel_deletetuihuoBase alloc]init];
                base.command= @"stop";
                base.current = @"refundment_confirm";
                JCModel_deletetuihuoRefundment *r = [[JCModel_deletetuihuoRefundment alloc]init];
                r.refundmentIdentifier =  listData.listIdentifier;
                base.refundment = r;
                
                NSDictionary *params = base.dictionaryRepresentation;
                
                
                AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
                manager.responseSerializer = [AFHTTPResponseSerializer serializer];
                NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
                request.timeoutInterval = 10.f;
                [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                
                NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                    if (!error) {
                        
                        NSArray *responseDictionary = (NSArray *)responseObject;
                        //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                        NSString *result = [dic objectForKey:@"result"];
                        NSString *msg = [dic objectForKey:@"msg"];
                        NSLog(@"%@",dic);
                        if ([result isEqualToString:@"success"]) {
                            
                            [self showInfo:@"删除成功"];
                            [self readData];
                            
                        }else {
                            [self showInfo:msg];
                            NSLog(@"%@",msg);
                        }
                    } else {
                        NSLog(@"请求失败error=%@", error);
                    }
                }];
                
                [task resume];
                
            }
            
        }];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return  80;
    
}

-(void)readData {
    
    
    JCRequest_getRefundmentsByPageSearch *request = [[JCRequest_getRefundmentsByPageSearch alloc]init];
    
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
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_getRefundmentsByPageSearch *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic =  request.responseJSONObject;
        NSLog(@"dic::::::::::%@",dic);
        JCModel_salesReturnBase *base = [[JCModel_salesReturnBase alloc]initWithDictionary:dic];
        JCModel_salesReturnData *data = [[JCModel_salesReturnData alloc]init];
        data = base.data;
        _dataArray = data.list;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_getRefundmentsByPageSearch *request, NSError *error) {
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
