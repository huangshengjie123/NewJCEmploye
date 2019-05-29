//
//  RefundDetailsViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2019/1/30.
//  Copyright © 2019年 洁澄水业科技有限公司. All rights reserved.
//

#import "RefundDetailsViewController.h"
#import "Macro.h"
#import "PersonDetailsTableViewCell.h"
#import "ItemsTableViewCell.h"
#import "DataModels.h"
#import "LCNetworkConfig.h"
@interface RefundDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataarray;
@end

@implementation RefundDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"退款详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];

}
-(void)addViews {
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCBackgroundColor;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(JCNew64);
        make.bottom.equalTo(self.view.mas_bottom).offset(-110);
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
//    UIButton *button = [[UIButton alloc]init];
//    button.backgroundColor = JCColorBlue;
//    [self.view addSubview:button];
//    [button mas_makeConstraints:^(MASConstraintMaker *make) {
//       make.left.
//    }];
    
    if ([_listData.status  isEqual:  @"refundment_check"]) {
        //如果是待财务检查状态
        [self addTwoButton];
    }
    
}
-(void)addTwoButton{
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    
    UIButton *leftbutton = [[UIButton alloc]init];
    leftbutton.backgroundColor = JCColorBlue;
    [self.view addSubview:leftbutton];
    [leftbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(w));
        make.left.equalTo(self.view).offset(20);
        make.bottom.equalTo(self.view).offset(-30);
        make.height.equalTo(@(40));
    }];
    leftbutton.tag = 0;
    [leftbutton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label = [[UILabel alloc]init];
    label.text = @"取消";
    label.textColor = JCColorWithe;
    label.font = JCFont14;
    [leftbutton addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(leftbutton);
        make.centerY.equalTo(leftbutton);
    }];
    leftbutton.layer.masksToBounds = YES;
    leftbutton.layer.cornerRadius = 4;
    leftbutton.hidden = NO;
    
    
    UIButton *rightButton = [[UIButton alloc]init];
    rightButton.backgroundColor = JCColorBlue;
    [self.view addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(leftbutton.mas_right).offset(20);
        make.width.equalTo(@(w));
        make.height.equalTo(@(40));
        make.centerY.equalTo(leftbutton);
    }];
    rightButton.tag = 1;
    [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    rightButton.layer.masksToBounds = YES;
    rightButton.layer.cornerRadius = 4;
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorWithe;
    label2.font = JCFont14;
    label2.text = @"财务确认";

    [self.view addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(rightButton);
        make.centerX.equalTo(rightButton);
    }];

    
}

-(void)buttonAction:(UIButton *)button {
    if (button.tag == 0) {
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@refundment/dealRefundmentOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        JCModel_caiwushenpiBase *base = [[JCModel_caiwushenpiBase alloc]init];
        //        base.reimbursementItems = _dataarray1;
        base.command = @"next";
        base.current = @"refundment_check";
        base.passCheck = false;
        
        JCModel_caiwushenpiRefundment *refundemnt = [[JCModel_caiwushenpiRefundment alloc]init];
        refundemnt.refundmentIdentifier = _listData.listIdentifier;
        base.refundment = refundemnt;
        
        
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
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                NSLog(@"%@",dic);
                if ([result isEqualToString:@"success"]) {
                    
                    [self showInfo:@"取消成功"];
                    //                [self.delegate newOtherIncomeSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
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
    
    if (button.tag == 1) {
        
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@refundment/dealRefundmentOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        JCModel_caiwushenpiBase *base = [[JCModel_caiwushenpiBase alloc]init];
        //        base.reimbursementItems = _dataarray1;
        base.command = @"next";
        base.current = @"refundment_check";
        base.passCheck = true;
        
        JCModel_caiwushenpiRefundment *refundemnt = [[JCModel_caiwushenpiRefundment alloc]init];
        refundemnt.refundmentIdentifier = _listData.listIdentifier;
        base.refundment = refundemnt;
        
        
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
                
                NSArray *responseDictionary = (NSArray *)responseObject;
                //                    NSDictionary *result =[[ NSDictionary alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
                NSString *result = [dic objectForKey:@"result"];
                NSString *msg = [dic objectForKey:@"msg"];
                NSLog(@"%@",dic);
                if ([result isEqualToString:@"success"]) {
                    
                    [self showInfo:@"通过成功"];
                    //                [self.delegate newOtherIncomeSuccess];
                    [self.navigationController popViewControllerAnimated:YES];
                    
                }else {
                    [self showInfo:msg];
                }
            } else {
                NSLog(@"请求失败error=%@", error);
            }
        }];
        
        [task resume];
        
        
    }
    
}
    

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
 
    if (section == 0) {
           return 12;
    }else {
        return _listData.refundmentCosts.count;
    }
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 0) {
        
        static NSString *identifier = @"PersonDetailsTableViewCell";
        PersonDetailsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            cell = [[PersonDetailsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        if (indexPath.row == 0) {
            cell.titleLabel.text = @"姓名:";
            cell.contentLabel.text = _listData.customer.name;
            cell.arrowImageView.hidden = YES;
        }
      
        if (indexPath.row == 1) {
            cell.titleLabel.text = @"销售单编号:";
            cell.contentLabel.text = _listData.oid;
            cell.arrowImageView.hidden = YES;

        }
        if (indexPath.row == 2) {
            cell.titleLabel.text = @"销售单支付方式:";
            cell.contentLabel.text = @"点击查看";
        }
        if (indexPath.row == 3) {
            cell.titleLabel.text = @"订单编号:";
            cell.contentLabel.text = _listData.listIdentifier;
            cell.arrowImageView.hidden = YES;
        }
        if (indexPath.row == 4) {
            cell.titleLabel.text = @"状态:";
            cell.contentLabel.text = [JCTool tuihuo:_listData.status];
            cell.arrowImageView.hidden = YES;

        }
        if (indexPath.row == 5) {
            cell.titleLabel.text = @"时间:";
            cell.contentLabel.text = _listData.createTime;
            cell.arrowImageView.hidden = YES;

        }
        if (indexPath.row == 6) {
            
            cell.titleLabel.text = @"来源类别:";
            if ([_listData.type  isEqual: @"sale"]) {
                   cell.contentLabel.text = @"普通销售";
            }
            
            if ([_listData.type  isEqual: @"franGrant"]) {
                cell.contentLabel.text = @"经销商支持销售";
            }
            cell.arrowImageView.hidden = YES;

         
        }
        if (indexPath.row == 7) {
            cell.titleLabel.text = @"业务员:";
            cell.contentLabel.text = _listData.staff.name;
            cell.arrowImageView.hidden = YES;

        }
        if (indexPath.row == 8) {
            cell.titleLabel.text = @"销售单总额:";
            cell.contentLabel.text = [NSString stringWithFormat:@"%d",(int)_listData.getamount];
            cell.arrowImageView.hidden = YES;

        }
        if (indexPath.row == 9) {
            cell.titleLabel.text = @"退款总额:";
            cell.contentLabel.text = [NSString stringWithFormat:@"%d",(int)_listData.refundment];
            cell.arrowImageView.hidden = YES;

        }
        if (indexPath.row == 10) {
            cell.titleLabel.text = @"退款方式:";
            cell.contentLabel.text = @"暂无";
            cell.arrowImageView.hidden = YES;

        }
        if (indexPath.row == 11) {
            cell.titleLabel.text = @"退货物品:";
            cell.contentLabel.text = @"";
            cell.arrowImageView.hidden = YES;

        }
        
        
        return cell;
        
    }else {
        static NSString *identifier = @"ItemsTableViewCell1";
        // 1.缓存中取
        ItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        // 2.创建
        if (cell == nil) {
            cell = [[ItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        
        if (indexPath.section == 1) {
//            JCModel_refundData3RefundmentCosts *costs11111 = ;

//            cell.contentLabel.text =_listData.refundmentCosts[indexPath.row].name;
//            cell.numberLabel.text = [NSString stringWithFormat:@"%d",(int)costs11111.num];
            
        }
        return cell;
        
    }
    
    
   
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 33;
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
