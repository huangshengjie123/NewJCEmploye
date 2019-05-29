//
//  AddressViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/6/6.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//

#import "AddressViewController.h"
#import "DataModels.h"
#import "Macro.h"
#import "JCRequest_readAddress.h"
#import "MBProgressHUD.h"
@interface AddressViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@property (nonatomic,assign) BOOL isEmpty;
@end

@implementation AddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"地区选择";
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
    static NSString *identifier = @"addressCell";
    // 1.缓存中取
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    // 2.创建
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    JCModel_AddressSelectedData *data = _dataArray[indexPath.row];
    
    cell.textLabel.text = data.areaName;
    cell.textLabel.textColor = JCColorBlack;
    cell.textLabel.font  = JCFont14;
    
    UIView *lineview= [[UIView alloc]init];
    lineview.backgroundColor = JCBackgroundColor;
    [cell.contentView addSubview:lineview];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(cell.contentView);
        make.height.equalTo(@(1));
    }];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    JCModel_AddressSelectedData *data = _dataArray[indexPath.row];
    
  
    
    JCRequest_readAddress *request = [[JCRequest_readAddress alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"parentId":data.areaId
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readAddress *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_AddressSelectedBase *base = [[JCModel_AddressSelectedBase alloc]initWithDictionary:dic];
        if (base.data.count == 0) {
            MBProgressHUD *hud = [[MBProgressHUD alloc]init];
            [self.view addSubview:hud];
            hud.label.text =@"没有数据";
            hud.mode = MBProgressHUDModeText;
            [hud showAnimated:YES];
            [hud hideAnimated:YES afterDelay:1];
            
           
            _isEmpty = YES;
//            [self.delegate selectedAddress:data.xpath];
            [ self.delegate selectedAddress:data.xpath and:data.areaId];
            [self.navigationController popViewControllerAnimated:YES];
            
        }else {
        
            _isEmpty = NO;

            _dataArray = base.data;
        
            [_tableView reloadData];
        }
        
    } failure:^(__kindof JCRequest_readAddress *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
    if (_isEmpty == YES) {
        
    }
    
}


-(void)readData {
    JCRequest_readAddress *request = [[JCRequest_readAddress alloc]init];
    
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"level":@"2"
                                };
    
    
    [request startWithBlockSuccess:^(__kindof JCRequest_readAddress *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_AddressSelectedBase *base = [[JCModel_AddressSelectedBase alloc]initWithDictionary:dic];
        _dataArray = base.data;
        [_tableView reloadData];
        
    } failure:^(__kindof JCRequest_readAddress *request, NSError *error) {
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
