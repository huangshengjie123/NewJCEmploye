//
//  RecyclingViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/16.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "RecyclingViewController.h"
#import "Macro.h"
#import "RecyclingTableViewCell.h"
#import "JCRequest_ReadRecycling.h"
#import "DataModels.h"
#import "JCRequest_updateCooPointCostItemBackItemXNums.h"
#import "LCNetworkConfig.h"
@interface RecyclingViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation RecyclingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"回收设备";
    [self addViews];
    self.view.backgroundColor = JCBackgroundColor;
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
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"RecyclingTableViewCell";
    // 1.缓存中取
    RecyclingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[RecyclingTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_recyclingData *data = _dataArray[indexPath.row];
    
    cell.titleLabel.text = data.itemName;
    cell.button.tag = indexPath.row;
    [cell.button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
   
    
    return cell;
    
    
}
-(void)buttonAction:(UIButton *)button {
    
     JCModel_recyclingData *data = _dataArray[button.tag];
    
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@cooPoint/updateCooPointCostItemBack.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    // 请求参数字典
    
    JCModel_updateCooPointCostItemBackBase *base = [[JCModel_updateCooPointCostItemBackBase alloc]init];
    
    base.internalBaseClassIdentifier = _idString.doubleValue;
    
    JCModel_updateCooPointCostItemBackItemXNums *itemData = [[JCModel_updateCooPointCostItemBackItemXNums alloc]init];
    itemData.item = data.item;
    itemData.num = data.num;
    
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    [array addObject:itemData];
    base.itemXNums = array;
 

    NSDictionary *params = base.dictionaryRepresentation;
    
    NSLog(@"%@",params);
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSMutableURLRequest *request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:accessPath parameters:params error:nil];
    request.timeoutInterval = 10.f;
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        if (!error) {
            
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
            NSString *result = [dic objectForKey:@"result"];
            NSString *msg = [dic objectForKey:@"msg"];
            if ([result  isEqual: @"success"] ) {
           
                [self showInfo:@"回收成功"];
                
                [self readData];
                
            } else {
                [self showInfo:msg];
            }
            
            NSLog(@"成功%@",result);
        } else {
            NSLog(@"请求失败error=%@", error);
        }
    }];
    
    [task resume];
    
    
    
}

-(void)readData{
    JCRequest_ReadRecycling *request = [[JCRequest_ReadRecycling alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":_idString
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_ReadRecycling *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        
        JCModel_recyclingBase *base = [[JCModel_recyclingBase alloc]initWithDictionary:dic];
        
        _dataArray = base.data;
        
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_ReadRecycling *request, NSError *error) {
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
