//
//  OutboundViewController.m
//  NewJCEmploye
//
//  Created by 陳升琪 on 2018/3/1.
//  Copyright © 2018年 洁澄水业科技有限公司. All rights reserved.
//  出库单

#import "OutboundViewController.h"
#import "Macro.h"
#import "ItemsTableViewCell.h"
#import "LCNetworkConfig.h"
#import "SGActionView.h"
#import "MBProgressHUD.h"
#import "SGQRCode.h"
#import "WCQRCodeScanningVC.h"
#import "DataModels.h"
#import "ReWriteOutBoundViewController.h"
#import "ShowCodeViewController.h"
#import "JCRequset_SearchCode.h"
#import "LCRquest_searchFranchiserInOutOrders.h"
#import "JCRequest_ReadAllSell.h"
#import "SellDetailsViewController.h"
#import "JCRequest_readMyProbationOrder.h"
#import "JCRequest_searchCooPointOrder.h"
#import "ProbationDetailsViewController.h"
#import "CooperationDetailedViewController.h"
#import "JCRequest_readFranchiserInoutOrder1.h"

@interface OutboundViewController ()<UITableViewDelegate,UITableViewDataSource,SGQRCodeScanManagerDelegate,WCQRCodeDelegate>


@property (nonatomic,strong) UILabel *nameLabel;//申请人
@property (nonatomic,strong) UILabel *stateLabel;//审批状态
@property (nonatomic,strong) UILabel *timeLabel;//申请时间

@property (nonatomic,strong) UILabel *orderNumLabel;//出库单号
@property (nonatomic,strong) UILabel *useLabel;//用途
@property (nonatomic,strong) UILabel *orderFaNumLabel;// 相关单子的单号
@property (nonatomic,strong) UILabel *remarkLabel;//备注


@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray     *dataArray;
@property (nonatomic,strong) UILabel     *label3; //物品: label
@property (nonatomic,strong) UIView      *midView;


@end

@implementation OutboundViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"出入库详情";
    self.view.backgroundColor = JCBackgroundColor;
    [self addViews];
}

-(void)addViews {
    
    UIView *topView = [[UIView alloc]init];
    topView.backgroundColor = JCColorWithe;
    [self.view addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(JCNew64 + 5);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@(44));
    }];
    
    UIView *lineView = [[UIView alloc]init];
    lineView.backgroundColor = GrayColor;
    [topView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(topView);
        make.top.equalTo(topView.mas_bottom);
        make.height.equalTo(@(1));
    }];
    
    _nameLabel  = [[UILabel alloc]init];
    _nameLabel.textColor = JCColorBlack;
    _nameLabel.font = JCFont14;
    [topView addSubview:_nameLabel];
    [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(topView).offset(10);
        make.centerY.equalTo(topView);
    }];
    _nameLabel.text = _listData.applicantInfo.name;
    
    _stateLabel = [[UILabel alloc]init];
    _stateLabel.textColor = JCColorBlack;
    _stateLabel.font = JCFont14;
    [topView addSubview:_stateLabel];
    [_stateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView);
        make.centerX.equalTo(topView);
    }];
    
    _stateLabel.text = [JCTool determinesOutputStatusSringWith:_listData.status];
    //如果是可以扫码出库的状态 就添加 扫码按钮
    if ([_listData.status  isEqual: @"scrap_leader_check"])
    {
        UIButton *leftButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setTitle:@"不通过" forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        leftButton.backgroundColor = JCColorBlue;
        [self.view addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view.mas_centerX).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        leftButton.layer.masksToBounds = YES;
        leftButton.layer.cornerRadius = 5.0f;
        leftButton.tag = 13;
        [leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setTitle:@"检查通过" forState:UIControlStateNormal];
        rightButton.backgroundColor = JCColorBlue;
        rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.view addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        rightButton.layer.masksToBounds = YES;
        rightButton.layer.cornerRadius = 5.0f;
        rightButton.tag = 14;
        [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    if ([[JCTool determinesOutputStatusSringWith:_listData.status]  isEqual: @"扫码出库"] && [_vcString isEqualToString:@"all"] )
    {
        UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"扫码出库" forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(44));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5.0f;
        button.backgroundColor =JCColorBlue;
        button.tag = 1;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    //如果是
    if ([_listData.status  isEqual: @"output_requst_check"] && [_vcString isEqualToString:@"all"]) {
        
        UIButton *leftButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setTitle:@"打回修改" forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        leftButton.backgroundColor = JCColorBlue;
        [self.view addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view.mas_centerX).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        leftButton.layer.masksToBounds = YES;
        leftButton.layer.cornerRadius = 5.0f;
        leftButton.tag = 2;
        [leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];

        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setTitle:@"检查通过" forState:UIControlStateNormal];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        rightButton.backgroundColor = JCColorBlue;
        
        [self.view addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        rightButton.layer.masksToBounds = YES;
        rightButton.layer.cornerRadius = 5.0f;
        rightButton.tag = 3;
        [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //经销上出入库详情
    if ([_listData.status  isEqual: @"f_output_requst_check"] && [_vcString isEqualToString:@"all"])
    {
        
        UIButton *leftButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setTitle:@"打回修改" forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        leftButton.backgroundColor = JCColorBlue;
        [self.view addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view.mas_centerX).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        leftButton.layer.masksToBounds = YES;
        leftButton.layer.cornerRadius = 5.0f;
        leftButton.tag = 11;
        [leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setTitle:@"检查通过" forState:UIControlStateNormal];
        rightButton.backgroundColor = JCColorBlue;
        [self.view addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        rightButton.layer.masksToBounds = YES;
        rightButton.layer.cornerRadius = 5.0f;
        rightButton.tag = 12;
        [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    //如果是
    if ([[JCTool determinesOutputStatusSringWith:_listData.status]  isEqual: @"出库仓库驳回"]  && [_vcString  isEqual: @"my"])
    {
        UIButton *leftButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setTitle:@"取消出库单" forState:UIControlStateNormal];
        leftButton.titleLabel.font = [UIFont systemFontOfSize:14];
        leftButton.backgroundColor = JCColorBlue;
        [self.view addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view.mas_centerX).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        leftButton.layer.masksToBounds = YES;
        leftButton.layer.cornerRadius = 5.0f;
        leftButton.tag = 4;
        [leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setTitle:@"修改出库单" forState:UIControlStateNormal];
        rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        rightButton.backgroundColor = JCColorBlue;
        [self.view addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        rightButton.layer.masksToBounds = YES;
        rightButton.layer.cornerRadius = 5.0f;
        rightButton.tag = 5;
        [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    if ([[JCTool determinesOutputStatusSringWith:_listData.status]  isEqual: @"扫码出库"]  && [_vcString  isEqual: @"my"])
    {
        
        UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"展示出库二维码" forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(44));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5.0f;
        button.backgroundColor =JCColorBlue;
        button.tag = 6;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    if ([[JCTool determinesOutputStatusSringWith:_listData.status]  isEqual: @"扫码入库"]  && [_vcString  isEqual: @"my"])
    {
        
        UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"展示出库二维码" forState:UIControlStateNormal];
        [self.view addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(44));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 5.0f;
        button.backgroundColor =JCColorBlue;
        button.tag = 6;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    if ([[JCTool determinesOutputStatusSringWith:_listData.status]  isEqual: @"入库检查"]  && [_vcString  isEqual: @"all"])
    {
        UIButton *leftButton  = [UIButton buttonWithType:UIButtonTypeCustom];
        [leftButton setTitle:@"打回修改" forState:UIControlStateNormal];
        leftButton.backgroundColor = JCColorBlue;
        [self.view addSubview:leftButton];
        [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view).offset(10);
            make.right.equalTo(self.view.mas_centerX).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        leftButton.layer.masksToBounds = YES;
        leftButton.layer.cornerRadius = 5.0f;
        
        leftButton.tag = 9;
        [leftButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
        
        UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [rightButton setTitle:@"检查通过" forState:UIControlStateNormal];
        rightButton.backgroundColor = JCColorBlue;
        [self.view addSubview:rightButton];
        [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.view.mas_centerX).offset(10);
            make.right.equalTo(self.view).offset(-10);
            make.height.equalTo(@(40));
            make.bottom.equalTo(self.view).offset(-20);
        }];
        rightButton.layer.masksToBounds = YES;
        rightButton.layer.cornerRadius = 5.0f;
        rightButton.tag = 10;
        [rightButton addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    _timeLabel = [[UILabel alloc]init];
    _timeLabel.font = [UIFont systemFontOfSize:11];
    _timeLabel.textColor = MidGrayColor;
    [topView addSubview:_timeLabel];
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.mas_centerY);
        make.right.equalTo(topView.mas_right).offset(-10);
    }];
    _timeLabel.text = _listData.createTime;
    
    _midView = [[UIView alloc]init];
    _midView.backgroundColor = JCColorWithe;
    [self.view addSubview:_midView];
    [_midView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(topView.mas_bottom).offset(5);
        make.height.equalTo(@(140/2 + 10));
    }];
    
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"单号:";
    label1.font = JCFont14;
    label1.textColor = JCColorBlack;
    [_midView addSubview:label1];
    [ label1 mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(_midView).offset(10);
         make.top.equalTo(_midView).offset(10);
     }];
     
     
     _orderNumLabel  =  [[UILabel alloc]init];
     _orderNumLabel.font = JCFont14;
     _orderNumLabel.textColor = JCColorBlack;
    _orderNumLabel.text = _listData.listIdentifier;
    [_midView addSubview:_orderNumLabel];
    [_orderNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label1);
        make.left.equalTo(label1.mas_right).offset(10);
    }];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.textColor = JCColorBlack;
    label2.font = JCFont14;
    label2.text = @"用途:";
    [_midView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView.mas_left).offset(10);
        make.top.equalTo(label1.mas_bottom).offset(7);
    }];
    
    UILabel *label11 = [[UILabel alloc]init];
    label11.textColor = JCColorBlack;
    label11.font = JCFont14;
    label11.text = @"具体业务单号:";
    [_midView addSubview:label11];
    [label11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_midView.mas_left).offset(10);
        make.top.equalTo(label2.mas_bottom).offset(7);
    }];
    
    _orderFaNumLabel = [[UILabel alloc]init];
    _orderFaNumLabel.textColor = JCColorBlue;
    _orderFaNumLabel.font = JCFont14;
    [_midView addSubview:_orderFaNumLabel];
    [_orderFaNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label11);
        make.left.equalTo(label11.mas_right).offset(10);
    }];
    _orderFaNumLabel.text = _listData.faOrderId;
    
    UIButton *button11 = [[UIButton alloc]init];
    button11.backgroundColor = [UIColor clearColor];
    
    [_midView addSubview:button11];
    [button11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(_orderFaNumLabel);
        make.top.equalTo(_orderFaNumLabel.mas_top).offset(-10);
        make.bottom.equalTo(_orderFaNumLabel.mas_bottom).offset(10);
    }];
    [button11 addTarget:self action:@selector(button11Action) forControlEvents:UIControlEventTouchUpInside];
    
    
    _useLabel = [[UILabel alloc]init];
    _useLabel.textColor = JCColorBlack;
    _useLabel.font = JCFont14;
    [_midView addSubview:_useLabel];
    [_useLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2.mas_right).offset(10);
        make.centerY.equalTo(label2);
    }];
    if ([_listData.reason  isEqual: @"Probation"]) {
        _useLabel.text = @"送试用";
    }
    if ([_listData.reason isEqualToString:@"Sale"]) {
        _useLabel.text = @"销售";
    }
    
    if ([_listData.reason isEqualToString:@"CooPoint"]) {
        _useLabel.text = @"合作点";
    }
    if ([_listData.reason isEqualToString:@"CooPointAll"]) {
        _useLabel.text = @"合作点";
    }
    if ([_listData.reason isEqualToString:@"Office"]) {
        _useLabel.text = @"其他";
    }
    if ([_listData.reason isEqualToString:@"Distribution"]) {
        _useLabel.text = @"配送";
    }
    if ([_listData.reason isEqualToString:@"Normal"]) {
        _useLabel.text = @"普通";
    }
    if ([_listData.reason isEqualToString:@"Visit"]) {
        _useLabel.text = @"回访";
    }
    if ([_listData.reason isEqualToString:@"PurchaseSend"]) {
        _useLabel.text = @"进货";
    }
    if ([_listData.reason isEqualToString:@"FranGrantSale"]) {
        _useLabel.text = @"经销商支持出库";
    }
    
    _label3 = [[UILabel alloc]init];
    _label3.textColor = JCColorBlack;
    _label3.font = JCFont14;
    _label3.text = @"物品:";
    [_midView addSubview:_label3];
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label11.mas_bottom).offset(7);
    }];
    
    _dataArray = _listData.items;

    if (_isBeyound == YES)
    {
        //如果是超期待办进来就不给任何审批
    }
    else
    {
        if ([_listData.status isEqualToString:inOutStatus_leaderCheck])
        {
//            [self addLeaderButton];
        }
        
    }

    [self addTableView];
    [self addremakeView];
}


#pragma mark - 跳转到各个详情单中

-(void)button11Action {

    if ([_listData.reason  isEqual: @"Sale"])
    {
        //跳到销售中   查询然后跳转
        JCRequest_ReadAllSell *request = [[JCRequest_ReadAllSell alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"id" :_listData.faOrderId,
                                    @"pageNum" :pageNum,
                                    @"pageSize":pageSize,
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_ReadAllSell *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            NSLog(@"responseJSONObject:::::::%@",request.responseJSONObject);
            JCModel_SellOrderBase *base = [[JCModel_SellOrderBase alloc]initWithDictionary:dic];
            JCModel_SellOrderData *data =  [[JCModel_SellOrderData alloc]init];
            data = base.data;
            NSArray *array = data.list;
            if (array.count >0)
            {
                JCModel_SellOrderList *list = array[0];
                SellDetailsViewController *vc = [[SellDetailsViewController alloc]init];
                vc.sellOrderList = list;
                vc.isReadOfLeader = YES;
                [self.navigationController pushViewController:vc animated:YES];
            }

        } failure:^(__kindof JCRequest_ReadAllSell *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
        
    }
    
    
      if ([_listData.reason  isEqual: @"Probation"])
      {
          //跳到试用单中
          if (_listData.faOrderId == nil)
          {
              return;
          }
          JCRequest_readMyProbationOrder *request = [[JCRequest_readMyProbationOrder alloc]init];
          LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
          [request addAccessory:requestAccessory];
          NSString *token = [JCTokenManager getToken];
          NSString  *pageNum = [NSString stringWithFormat:@"1"];
          NSString  *pageSize = [NSString stringWithFormat:@"100"];
          
          request.requestArgument = @{
                                      @"isAppLogin":@"true",
                                      @"jc4login":token,
                                      @"id":_listData.faOrderId,
                                      @"pageNum":pageNum,
                                      @"pageSize":pageSize
                                      };
          
          
          [request startWithBlockSuccess:^(__kindof JCRequest_readMyProbationOrder *request) {
              //
              NSLog(@"成功获取试用单");
              NSDictionary *dic =  request.rawJSONObject;
              JCModel_probationOrderBase *base = [[JCModel_probationOrderBase alloc]initWithDictionary:dic];
              JCModel_probationOrderData *data = base.data;
              if (data.list.count >0) {
                  
                  JCModel_probationOrderList * list = data.list[0];
                  ProbationDetailsViewController *probationDeatilsVC = [[ProbationDetailsViewController alloc]init];
                  probationDeatilsVC.probationOrderList = list;
                  
                  probationDeatilsVC.isReadOfLeader = YES;
                  [self.navigationController pushViewController:probationDeatilsVC animated:YES];
              }
              
       
              
          } failure:^(__kindof JCRequest_readMyProbationOrder *request, NSError *error) {
              NSLog(@"失败获取试用单 %@",error);
          }];

      }
    
    if ([_listData.reason  isEqual: @"CooPoint"]  || [_listData.reason  isEqual: @"CooPointAll"] )
    {
        
        JCRequest_searchCooPointOrder *request = [[JCRequest_searchCooPointOrder alloc]init];
        LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
        [request addAccessory:requestAccessory];
        NSString *token = [JCTokenManager getToken];
//        NSString *userID = [JCTokenManager getUserID];
        NSString  *pageNum = [NSString stringWithFormat:@"1"];
        NSString  *pageSize = [NSString stringWithFormat:@"100"];
        
        request.requestArgument = @{
                                    @"isAppLogin":@"true",
                                    @"jc4login":token,
                                    @"pageNum":pageNum,
                                    @"pageSize":pageSize,
                                    @"id":_listData.faOrderId,
                                    };
        
        [request startWithBlockSuccess:^(__kindof JCRequest_searchCooPointOrder *request) {
            //
            NSLog(@"成功");
            NSDictionary *dic = request.responseJSONObject;
            
            JCModel_CooperationPoiontOrderBase *base = [[JCModel_CooperationPoiontOrderBase alloc]initWithDictionary:dic];
            JCModel_CooperationPoiontOrderData *data = [[JCModel_CooperationPoiontOrderData alloc]init];
            data = base.data;
            
            if (data.list.count > 0) {
                JCModel_CooperationPoiontOrderList *list = data.list[0];
                
                CooperationDetailedViewController *vc = [[CooperationDetailedViewController alloc]init];
                vc.list = list;
                [self.navigationController pushViewController:vc animated:YES];
            }
            
            
            
        } failure:^(__kindof JCRequest_searchCooPointOrder *request, NSError *error) {
            NSLog(@"失败 %@",error);
        }];
        
        
    }
    
    
}


-(void)addLeaderButton {
    
    float w = (JCScreen_Width - 20 * 3) / 2;
    
    //添加两个button
    UIButton *button1  = [[UIButton alloc]init];
    button1.backgroundColor = JCColorBlue;
    [self.view addSubview:button1];
    [button1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    UILabel *label1 = [[UILabel alloc]init];
    label1.text = @"拒绝申请";
    label1.textColor = JCColorWithe;
    [button1 addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(button1);
    }];
    button1.tag  = 7;
    [button1 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button2 = [[UIButton alloc]init];
    button2.backgroundColor = JCColorBlue;
    [self.view addSubview:button2];
    [button2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-20);
        make.width.equalTo(@(w));
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@(44));
    }];
    button2.tag  = 8;
    [button2 addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *label2 = [[UILabel alloc]init];
    label2.text = @"同意申请";
    label2.textColor = JCColorWithe;
    [button2 addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.centerX.equalTo(button2);
    }];
    
    
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 3;
    
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 3;
    
}

-(void)addTableView {
    
    self.tableView = [[UITableView alloc]init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = JCColorWithe;
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(_midView.mas_bottom);
        make.height.equalTo(@(self.dataArray.count * (25)));
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.userInteractionEnabled = NO;
  
}

-(void)addremakeView  {
    
    UIView *remakeView = [[UIView alloc]init];
    remakeView.backgroundColor = JCColorWithe;
    [self.view addSubview:remakeView];
    [remakeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
        make.height.equalTo(@(30));
    }];
    
    UILabel *label4 = [[UILabel alloc]init];
    label4.text = @"备注:";
    label4.font = JCFont14;
    label4.textColor = JCColorBlack;
    [remakeView addSubview:label4];
    [label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(remakeView).offset(10);
        
        make.centerY.equalTo(remakeView);
    }];
    
    _remarkLabel = [[UILabel alloc]init];
    
    _remarkLabel.font = JCFont14;
    _remarkLabel.textColor = JCColorBlack;
     _remarkLabel.text = @" ";
    _remarkLabel.numberOfLines = 1;
    [remakeView addSubview:_remarkLabel];
    [_remarkLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label4.mas_right).offset(10);

        make.right.equalTo(remakeView.mas_right).offset(-10);
        make.centerY.equalTo(remakeView);

    }];
    
    _remarkLabel.text = _listData.comments;
//    UILabel *label = [[UILabel alloc]init];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _dataArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"ItemsTableViewCell";
    ItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[ItemsTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    JCModel_InAndOutItems *items = _listData.items[indexPath.row];
    cell.contentLabel.text = items.name;
    cell.numberLabel.text = [NSString stringWithFormat:@"  x  %d",(int)items.num];
    return  cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 25;
}


// 按钮集中处理
-(void)buttonAction:(UIButton *)button {
    
    //tag = 1 扫码    tag = 2 打回  tag =3 通过
    if (button.tag == 1)
    {
        //扫码操作
        //跳转到扫码界面
        WCQRCodeScanningVC *wcVC = [[WCQRCodeScanningVC alloc]init];
        wcVC.delegate = self;
        [self QRCodeScanVC:wcVC];
    }
    
    if (button.tag == 2)
    {
        
        //仓库打回操作
        //仓库打回的原因
        NSArray *array = @[@"缺货",@"数量不对",@"其他原因"];
        
        [SGActionView showSheetWithTitle:@"选择打回理由" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
            // 请求头
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_warehouseRejectJsonBase *base = [[JCModel_warehouseRejectJsonBase alloc]init];
            base.command = @"next";
            base.current = inOutStatus_check;
            base.isStoreOutCheckPass = NO;
            base.backReason = array[index];
            
            JCModel_warehouseRejectJsonInOutOrder *outOrder = [[JCModel_warehouseRejectJsonInOutOrder alloc]init];
            outOrder.inOutOrderIdentifier = _listData.listIdentifier;
            base.inOutOrder = outOrder;
            NSDictionary *params = base.dictionaryRepresentation;
            NSLog(@"%@",params);
            [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
                
                if ([responseDic[@"code"] integerValue] == 200)
                {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =@"打回成功";
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                    [self.delegate operationCompleted];
                    [self.navigationController popViewControllerAnimated:YES];
                
                }
                else
                {
                    [self showInfo:responseDic[@"msg"]];
                }
                
            } failure:^(NSError *error) {
                
            }];
        }];
        
        
    }
    
    if (button.tag == 3)
    {
        //仓库检查通过
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_warehouseRejectJsonBase *base = [[JCModel_warehouseRejectJsonBase alloc]init];
        base.command = @"next";
        base.current = inOutStatus_check;
        base.isStoreOutCheckPass = YES;
        
        JCModel_warehouseRejectJsonInOutOrder *outOrder = [[JCModel_warehouseRejectJsonInOutOrder alloc]init];
        outOrder.inOutOrderIdentifier = _listData.listIdentifier;
        
        base.inOutOrder = outOrder;
        NSDictionary *params = base.dictionaryRepresentation;
        NSLog(@"%@",params);
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                [self.view addSubview:hud];
                hud.label.text =@"通过成功";
                hud.mode = MBProgressHUDModeText;
                [hud showAnimated:YES];
                [hud hideAnimated:YES afterDelay:1];
                
                [self.delegate operationCompleted];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
    }
    
    if (button.tag ==  4)
    {
        //业务员取消订单
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_warehouseRejectJsonBase *base = [[JCModel_warehouseRejectJsonBase alloc]init];
        base.command = @"stop";
        JCModel_warehouseRejectJsonInOutOrder *outOrder = [[JCModel_warehouseRejectJsonInOutOrder alloc]init];
        outOrder.inOutOrderIdentifier = _listData.listIdentifier;
        base.inOutOrder = outOrder;
        NSDictionary *params = base.dictionaryRepresentation;
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate operationCompleted];
                
                [self showInfo:@"取消成功"];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    }
    
    if (button.tag == 5)
    {
        ReWriteOutBoundViewController *reWriteVC = [[ReWriteOutBoundViewController alloc]init];
        reWriteVC.listData = _listData;
        [self.navigationController pushViewController:reWriteVC animated:YES];
    }
    
    if (button.tag == 6)
    {
        // 展示出库二维码
        if ([_vc  isEqual: @"经销商"])
        {
            [self searchFCode:_listData.listIdentifier];
        }
        else
        {
            [self searchCode:_listData.listIdentifier];
        }
    }
    
    if (button.tag == 7)
    {
        // 拒绝申请
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        // 请求参数字典
        JCModel_outLeaderCheckBase *base = [[JCModel_outLeaderCheckBase alloc]init];
        base.command = @"next";
        base.current = inOutStatus_leaderCheck ;
        base.isLeaderCheck = true;
        JCModel_outLeaderCheckInOutOrder *probation = [[JCModel_outLeaderCheckInOutOrder alloc]init];;
        probation.inOutOrderIdentifier = _listData.listIdentifier;
        base.inOutOrder = probation;
        NSDictionary *params = base.dictionaryRepresentation;
 
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                //下一步拒绝成功  直接返回,重新刷新列表
                [self.delegate operationCompleted];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
    }
    
    if (button.tag == 8)
    {
        // 同意申请
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_outLeaderCheckBase *base = [[JCModel_outLeaderCheckBase alloc]init];
        base.command = @"next";
        base.current = inOutStatus_leaderCheck ;
        base.isLeaderCheck = true;
        JCModel_outLeaderCheckInOutOrder *probation = [[JCModel_outLeaderCheckInOutOrder alloc]init];;
        probation.inOutOrderIdentifier = _listData.listIdentifier;
        base.inOutOrder = probation;
        NSDictionary *params = base.dictionaryRepresentation;
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                //下一步拒绝成功  直接返回,重新刷新列表
                [self.delegate operationCompleted];
                [self.navigationController popViewControllerAnimated:YES];
                
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
        }];
    }
    if (button.tag == 9) {
        
        //仓库打回的原因
        NSArray *array = @[@"缺货",@"数量不对",@"其他原因"];
        
        [SGActionView showSheetWithTitle:@"选择打回理由" itemTitles:array selectedIndex:-1 selectedHandle:^(NSInteger index) {
    
            // 请求头
            LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
            NSString *token = [JCTokenManager getToken];
            NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
            
            // 请求参数字典
            JCModel_rukucancelBase *base = [[JCModel_rukucancelBase alloc]init];
            base.command = @"next";
            base.current = inOutStatus_inputCheck;
            base.isStoreInputCheckPass = NO;
            base.backReason = array[index];
            
            JCModel_rukucancelInOutOrder *outOrder = [[JCModel_rukucancelInOutOrder alloc]init];
            outOrder.inOutOrderIdentifier = _listData.listIdentifier;
            
            base.inOutOrder = outOrder;
            
            NSDictionary *params = base.dictionaryRepresentation;
          
            [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
                
                if ([responseDic[@"code"] integerValue] == 200)
                {
                    MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                    [self.view addSubview:hud];
                    hud.label.text =@"打回成功";
                    hud.mode = MBProgressHUDModeText;
                    [hud showAnimated:YES];
                    [hud hideAnimated:YES afterDelay:1];
                    
                    [self.delegate operationCompleted];
                    [self.navigationController popViewControllerAnimated:YES];
                }
                else
                {
                    [self showInfo:responseDic[@"msg"]];
                }
            } failure:^(NSError *error) {
                
            }];
        }];
        
    }

    if (button.tag == 10) {
        // 请求头
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_rukumodelBase *base = [[JCModel_rukumodelBase alloc]init];
        base.command = @"next";
        base.current = inOutStatus_inputCheck;
        base.isStoreInputCheckPass = YES;
        
        JCModel_rukumodelInOutOrder *outOrder = [[JCModel_rukumodelInOutOrder alloc]init];
        outOrder.inOutOrderIdentifier = _listData.listIdentifier;
        
        base.inOutOrder = outOrder;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                [self.view addSubview:hud];
                hud.label.text =@"通过成功";
                hud.mode = MBProgressHUDModeText;
                [hud showAnimated:YES];
                [hud hideAnimated:YES afterDelay:1];
                
                [self.delegate operationCompleted];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
        
    }
    
    if (button.tag == 11) {
        //经销商出库驳回
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserInOutOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        // 请求参数字典
        JCModel_tongguojignxiaoshangBase *base = [[JCModel_tongguojignxiaoshangBase alloc]init];
        base.command = @"next";
        base.current = @"f_output_requst_check";
        base.isStoreOutCheckPass = false;
        
        JCModel_tongguojignxiaoshangFranchiserInOutOrder *outOrder = [[JCModel_tongguojignxiaoshangFranchiserInOutOrder alloc]init];
        outOrder.franchiserInOutOrderIdentifier = _listData.listIdentifier;
        
        base.franchiserInOutOrder = outOrder;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                [self.view addSubview:hud];
                hud.label.text =@"驳回成功";
                hud.mode = MBProgressHUDModeText;
                [hud showAnimated:YES];
                [hud hideAnimated:YES afterDelay:1];
                
                [self.delegate operationCompleted];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
        } failure:^(NSError *error) {
            
            NSLog(@"error::::::%@",error);
        }];
    
    }
    
    if (button.tag == 12) {
        //经销商出库通过
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@franchiser/dealFranchiserInOutOrder.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_tongguojignxiaoshangBase *base = [[JCModel_tongguojignxiaoshangBase alloc]init];
        base.command = @"next";
        base.current = @"f_output_requst_check";
        base.isStoreOutCheckPass = true;
        
        JCModel_tongguojignxiaoshangFranchiserInOutOrder *outOrder = [[JCModel_tongguojignxiaoshangFranchiserInOutOrder alloc]init];
        outOrder.franchiserInOutOrderIdentifier = _listData.listIdentifier;
        
        base.franchiserInOutOrder = outOrder;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        NSLog(@"%@",params);
        
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                MBProgressHUD *hud = [[MBProgressHUD alloc]init];
                [self.view addSubview:hud];
                hud.label.text =@"检查成功";
                hud.mode = MBProgressHUDModeText;
                [hud showAnimated:YES];
                [hud hideAnimated:YES afterDelay:1];
                [self.delegate operationCompleted];
                
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
    }
    
    
    if (button.tag == 13) {
        //报废审核不通过
//        JCModel_ScrapApprovalBase *base = []
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealScrap.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_ScrapApprovalBase *base = [[JCModel_ScrapApprovalBase alloc]init];
        base.command = @"next";
        base.current = @"scrap_leader_check";
        base.isCheck = false;
        JCModel_ScrapApprovalInOutOrder *order = [[JCModel_ScrapApprovalInOutOrder alloc]init];
        order.inOutOrderIdentifier = _listData.listIdentifier;
        
        base.inOutOrder = order;
        
        NSDictionary *params = base.dictionaryRepresentation;
        
        NSLog(@"%@",params);
        
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate operationCompleted];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                [self showInfo:responseDic[@"msg"]];
            }
            
        } failure:^(NSError *error) {
            
        }];
    
    }
    
    
    if (button.tag == 14)
    {
        //报废审核通过
        LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
        NSString *token = [JCTokenManager getToken];
        NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealScrap.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
        
        // 请求参数字典
        JCModel_ScrapApprovalBase *base = [[JCModel_ScrapApprovalBase alloc]init];
        base.command = @"next";
        base.current = @"scrap_leader_check";
        base.isCheck = true;
        JCModel_ScrapApprovalInOutOrder *order = [[JCModel_ScrapApprovalInOutOrder alloc]init];
        order.inOutOrderIdentifier = _listData.listIdentifier;
        base.inOutOrder = order;
        NSDictionary *params = base.dictionaryRepresentation;
        
        [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
            
            if ([responseDic[@"code"] integerValue] == 200)
            {
                [self.delegate operationCompleted];
                [self.navigationController popViewControllerAnimated:YES];
            }
            else
            {
                
            }
        } failure:^(NSError *error) {
            
        }];
    }
}

-(void)searchCode:(NSString *)str{
    
    JCRequset_SearchCode *request = [[JCRequset_SearchCode alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":str
                                };
    [request startWithBlockSuccess:^(__kindof JCRequset_SearchCode *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_AllOutInputOrderBase *base = [[JCModel_AllOutInputOrderBase alloc]initWithDictionary:dic];
        JCModel_AllOutInputOrderData *data = base.data;
        if (data.params.checkcode != nil)
        {
            ShowCodeViewController *showCodeVC = [[ShowCodeViewController alloc]init];
            showCodeVC.codeString =    data.params.checkcode;
            [self.navigationController pushViewController:showCodeVC animated:YES];
        }

    } failure:^(__kindof JCRequset_SearchCode *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
}

-(void)searchFCode:(NSString *)str{
    
    JCRequest_readFranchiserInoutOrder1 *request = [[JCRequest_readFranchiserInoutOrder1 alloc]init];
    LCRequestAccessory *requestAccessory = [[LCRequestAccessory alloc]initWithShowVC:self];
    [request addAccessory:requestAccessory];
    NSString *token = [JCTokenManager getToken];
    NSString  *pageNum = [NSString stringWithFormat:@"1"];
    NSString  *pageSize = [NSString stringWithFormat:@"100"];
    request.requestArgument = @{
                                @"isAppLogin":@"true",
                                @"jc4login":token,
                                @"id":str,
                                @"pageNum":pageNum,
                                @"pageSize":pageSize,
                                };
    
    NSLog(@"%@",request.requestArgument);
    
    [request startWithBlockSuccess:^(__kindof JCRequset_SearchCode *request) {
        //
        NSLog(@"成功");
        NSDictionary *dic = request.responseJSONObject;
        JCModel_searchDetailsOutputFBase *base = [[JCModel_searchDetailsOutputFBase alloc]initWithDictionary:dic];
        JCModel_searchDetailsOutputFData *data = base.data;
        
        if (data.list.count >0 )
        {
            JCModel_searchDetailsOutputFList *listData  = data.list[0];
            if (listData.checkCode != nil)
            {
                ShowCodeViewController *showCodeVC = [[ShowCodeViewController alloc]init];
                showCodeVC.codeString =    listData.checkCode;
                [self.navigationController pushViewController:showCodeVC animated:YES];
                
            }
        }
        
    } failure:^(__kindof JCRequset_SearchCode *request, NSError *error) {
        NSLog(@"失败 %@",error);
    }];
    
    
}



- (void)QRCodeScanVC:(UIViewController *)scanVC {
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    if (device) {
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        switch (status) {
            case AVAuthorizationStatusNotDetermined: {
                [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                    if (granted) {
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            [self.navigationController pushViewController:scanVC animated:YES];
                        });
                        NSLog(@"用户第一次同意了访问相机权限 - - %@", [NSThread currentThread]);
                    } else {
                        NSLog(@"用户第一次拒绝了访问相机权限 - - %@", [NSThread currentThread]);
                    }
                }];
                break;
            }
            case AVAuthorizationStatusAuthorized: {
                [self.navigationController pushViewController:scanVC animated:YES];
                break;
            }
            case AVAuthorizationStatusDenied: {
                UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"请去-> [设置 - 隐私 - 相机 - SGQRCodeExample] 打开访问开关" preferredStyle:(UIAlertControllerStyleAlert)];
                UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
                    
                }];
                
                [alertC addAction:alertA];
                [self presentViewController:alertC animated:YES completion:nil];
                break;
            }
            case AVAuthorizationStatusRestricted: {
                NSLog(@"因为系统原因, 无法访问相册");
                break;
            }
                
            default:
                break;
        }
        return;
    }
    
    UIAlertController *alertC = [UIAlertController alertControllerWithTitle:@"温馨提示" message:@"未检测到您的摄像头" preferredStyle:(UIAlertControllerStyleAlert)];
    UIAlertAction *alertA = [UIAlertAction actionWithTitle:@"确定" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alertC addAction:alertA];
    [self presentViewController:alertC animated:YES completion:nil];
}

-(void)QRCodeScanManager:(SGQRCodeScanManager *)scanManager didOutputMetadataObjects:(NSArray *)metadataObjects {
    
    NSLog( @"%@",metadataObjects);
}

//扫描二维码 结果是
-(void)scanOfdata:(NSString *)str {
    
    NSLog(@"返回结果是%@",str);
    // 请求头
    LCNetworkConfig *config = [LCNetworkConfig sharedInstance];
    NSString *token = [JCTokenManager getToken];
    NSString *accessPath = [NSString stringWithFormat:@"%@flow/dealInOut.do?isAppLogin=true&jc4login=%@",config.mainBaseUrl,token];
    
    // 请求参数字典
    JCModel_ScanCodeBase *base = [[JCModel_ScanCodeBase alloc]init];
    base.command = @"next";
    base.current = inOutStatus_codeCheck;
    base.checkcode = str;
    
    JCModel_ScanCodeInOutOrder *outOrder = [[JCModel_ScanCodeInOutOrder alloc]init];
    outOrder.inOutOrderIdentifier = _listData.listIdentifier;
    
    base.inOutOrder = outOrder;
    
    NSDictionary *params = base.dictionaryRepresentation;
   
    [HttpTool postJSONRequestWithURLStr:accessPath params:params success:^(NSDictionary *responseDic) {
        
        if ([responseDic[@"code"] integerValue] == 200)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            [self showInfo:responseDic[@"msg"]];
        }
    } failure:^(NSError *error) {
        
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
